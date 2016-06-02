# Ruby gems
require 'sinatra'
require 'json'
require 'mongo'
require 'thin'

# configuration
require "./config"
require "./usaepay"
require "./dbutils"
require "./email"
require "./sms"

serverConfig = ServerConfig.new

# Configure Sinatra WebService
configure do
	
	# MongoDB setup
	db = Mongo::Client.new(serverConfig.mongoUrl + '/' + serverConfig.mongoDB)
    mailgun = EmailService.new serverConfig.mailgunApiKey
	sms = SMS.new(serverConfig.twilioSmsSID, serverConfig.twilioAuthToken, serverConfig.twilioNumber)
	
	set :reservations, db[:reservations]
	set :employees, db[:employees]
	set :email, mailgun
	set :sms, sms

	# SSL Thin Setup
	set :environment, serverConfig.env
	set :bind, '0.0.0.0'
	set :port, serverConfig.thinPort
	set :server, "thin"
	
end

helpers DB_Utils

# Routing Endpoints
get '/' do
	send_file 'index.html'
end

get '/ping' do
	"You pinged Miami Limo Coach Reservations"
end

post '/reservation' do

	content_type :json
	request.body.rewind
	
	# initialize variables for readability
	data = JSON.parse request.body.read
	reservation = data["reservation"]
	cc_data = data["cc"]
	payment_result = reservation_id = nil
		
	# If it's a fresh reservation request
	# We save the reservation before any payment processing
	if data["retry"].nil?
		reservation_id = reservations_insert(reservation).inserted_id
	else
		reservation_id = object_id(data["reservationID"])	
	end
	
	unless reservation['reservation_only']
		# Unreliable Payment system
		begin
			# Call Payment System Ruby API
		    epay = UsaEpay.new(serverConfig.usaEpayKey, serverConfig.usaEpayPin)
			payment_result = epay.executeTransaction(cc_data)
		rescue Exception => e
			return {
				status: 'error',
				resultCode: 'E',
				error: "Unable to process payment, please try again later or call Miami Limo Coach", 
				refNum: '0',
				errorType: 'usaepay'
			}.to_json
		end
		
		# Update reservation
		reservations_update_transaction(reservation_id, payment_result, data)
		
		# Email Oleg and Customer
		reservation_record = reservations_get_by_id(reservation_id)
		settings.email.send("customerAndOleg", reservation_record)
		
		# Return the payment status
		return {
			status: "ok",
			resultCode: payment_result.resultCode, 
			error: payment_result.error,
			refNum: payment_result.refNum,
			reservation: reservation_record
		}.to_json
	else
		reservation_record = reservations_get_by_id(reservation_id)
		settings.email.send("customerAndOleg", reservation_record)
		return {
			status: "ok",
			resultCode: "A",
			reservation: reservation_record
		}.to_json
	end
	
end

# Get Reservation in month range
get '/reservations/:start_month/:end_month' do
    content_type :json
    # Check for cookie before sending data
    reservations_get_by_month(params[:start_month].to_i, params[:end_month].to_i)
end

# Get Reservations for a date
get '/reservations_by_date/:year/:month/:day' do
    content_type :json
    # Check for cookie before sending data
    reservations_get_by_date(params[:year].to_i, params[:month].to_i, params[:day].to_i)
end

get '/reservations' do
	content_type :json
	reservations_get_all
end

get '/reservations/:id' do
	content_type :json
	reservations_get_by_id(params[:id]).to_json
end

delete '/reservations/:id' do 
	content_type :json
	
	# We retain data for analysis
	result = reservations_update_by_id(params[:id], {:status => "deleted"});
	status = result[:status] == "deleted" ? "ok" : "error"
	{status: status, deleted: result}.to_json
end

post '/employees' do
	content_type :json
	
	inserted = employees_add_one(params[:type], params[:name], params[:email], params[:phone])
	{id: inserted.inserted_id}.to_json
end

post '/employees/email_reservation' do
	content_type :json
	
	reservation = reservations_get_by_id params[:reservation_id]
	settings.email.send(params[:to], reservation)
end

post '/employees/sms_reservation' do
	content_type :json
	settings.sms.send(params[:to], params[:reservation_id]).to_json
end

get '/employees' do
	content_type :json
	
	employees_get_all
end