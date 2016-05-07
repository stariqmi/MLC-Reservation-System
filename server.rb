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

serverConfig = ServerConfig.new

# Configure Sinatra WebService
configure do
	
	# MongoDB setup
	db = Mongo::Client.new(serverConfig.mongoUrl + '/' + serverConfig.mongoDB)
    mailgun = EmailService.new serverConfig.mailgunApiKey
	
	set :mongo_db, db[:reservations]
	set :email, mailgun

	# SSL Thin Setup
	set :environment, serverConfig.env
	set :bind, '0.0.0.0'
	set :port, serverConfig.thinPort
	set :server, "thin"
end

helpers DbUtils

# Routing Endpoints
get '/' do
	send_file 'index.html'
end

get '/ping' do
	"You pinged Miami Limo Coach Reservations"
end

# Add reservation with Credit Card
post '/reservation_with_cc' do

	# Declare all variables to keep track
	reservation = nil
	insertResult = nil
	ccData = nil
	paymentResult = nil
	epay = nil
	reservationID = nil
	response = nil
	
	content_type :json
	db = settings.mongo_db
	
	request.body.rewind
	data = JSON.parse request.body.read
	
	reservation = data["reservation"]
	ccData = data["cc"]
	
	# If it's a fresh reservation request
	if data["retry"].nil?
		# Get Reservation data
		insertResult = db.insert_one reservation
		
		# Result in case the insert failed
		retStatus = {
			status: "error", 
			error: "Unable to process reservation request right now. Please try again later", 
			errorType: "local"
		}
		return retStatus.to_json unless insertResult.n == 1
	end
	
	p reservation.inspect
	unless reservation['reservation_only']
		# Put a try catch
		begin
			puts "Reservation with Credit Card payment"
			# Call Payment System Ruby API
		    epay = UsaEpay.new(serverConfig.usaEpayKey, serverConfig.usaEpayPin)
			puts "Initialized epay interface"
			paymentResult = epay.executeTransaction(ccData)
			puts "[MLC-log]>>>>>>>>>>>>>>>> SOAP Transaction Response <<<<<<<<<<<<<<<<<"
			p paymentResult.inspect
		rescue Exception => e
			puts e.message  
			puts e.backtrace.inspect
			p "ERROR: Call to UsaEpay SOAP system failed, please look into it."
			return {
				status: 'error',
				resultCode: 'E', 
				error: "Unable to process payment, please try again later or call Miami Limo Coach", 
				refNum: '0',
				errorType: 'usaepay'
			}.to_json
		end
		# End try catch
	
		# Get appropriate reservationID
		reservationID = data["retry"].nil? ? insertResult.inserted_id : object_id(data["reservationID"])
		
		# Update status of reservation
		status = case paymentResult.resultCode
		when "A"
			"payment-accepted"
		when "D"
			"payment-declined"
		when "E"
			"payment-failed"
		end
		
		transactionInfo = {
			:status => paymentResult.result,
			:amount => paymentResult.authAmount,
			:cardHolder => data["cc"]["fullName"],
			:cardNumber => data["cc"]["cardNumber"][data["cc"]["cardNumber"].length - 4, data["cc"]["cardNumber"].length],
			:refNum => paymentResult.refNum,
			:avsResult => paymentResult.avsResult,
			:authorization => paymentResult.authCode,
			:cvv2Result => paymentResult.cardCodeResult
		}
		
		update = update_by_id(reservationID, {
			:status => status,
			:transaction => transactionInfo
		})
		
		if status == "payment-accepted"
			settings.email.send reservation, transactionInfo
		end
		
		# Return the payment status
		return {
			status: "ok",
			resultCode: paymentResult.resultCode, 
			error: paymentResult.error,
			refNum: paymentResult.refNum,
			reservation: document_by_id(reservationID)
		}.to_json
	else
		puts "Reservation only"
		settings.email.send reservation, nil
		return {
			status: "ok",
			resultCode: "A",
			reservation: document_by_id(insertResult.inserted_id)
		}.to_json
	end
	
end

# Get Reservation in month range
get '/reservations/:start_month/:end_month' do
    content_type :json
    # Check for cookie before sending data
    get_reservations_by_month(params[:start_month].to_i, params[:end_month].to_i)
end

# Get Reservations for a date
get '/reservations_by_date/:year/:month/:day' do
    content_type :json
    # Check for cookie before sending data
    get_reservations_by_date(params[:year].to_i, params[:month].to_i, params[:day].to_i)
end

get '/reservations' do 
	get_all_reservations
end

get '/reservations/:id' do
	content_type :json
	document = document_by_id params[:id]
	document.to_json
end

delete '/reservations/:id' do 
	content_type :json
	
	# We retain data for analysis
	result = update_by_id(params[:id], {:status => "deleted"});
	status = result[:status] == "deleted" ? "ok" : "error"
	{status: status, deleted: result}.to_json
end