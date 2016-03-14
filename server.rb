# Ruby gems
require 'sinatra'
require 'json'
require 'mongo'
require 'thin'

# configuration
require "./config"
require "./usaepay"
require "./dbutils"

serverConfig = ServerConfig.new

# Configure Sinatra WebService
configure do
	
	# MongoDB setup
	db = Mongo::Client.new(serverConfig.mongoUrl + '/' + serverConfig.mongoDB)
    	set :mongo_db, db[:reservations]
	
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
	request.body.rewind
	data = JSON.parse request.body.read
	
	content_type :json
	db = settings.mongo_db
	
	# If it's a fresh reservation request
	if data["retry"].nil?
		# Get Reservation data
		reservation = data["reservation"]
		result = db.insert_one reservation
		
		return {status: "error", error: "Unable to process reservation request right now. Please try again later", errorType: "local"} unless result.n == 1
	end
	
	# Get CC Data
	ccData = data["cc"]
	# Put a try catch
	begin
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
			errorType: 'usaepay',
			reservation: savedReservation
		}.to_json
	end
	# End try catch
	
	# Get appropriate reservationID
	reservationID = data["retry"].nil? ? result.inserted_id : object_id(data["reservationID"])
	# Update status of reservation
	status = case paymentResult.resultCode
	when "A"
		"payment-accepted"
	when "D"
		"payment-declined"
	when "E"
		"payment-failed"
	end
	
	update = update_by_id(reservationID, {
		:status => status,
		:transaction => {
			:status => paymentResult.result,
			:amount => paymentResult.authAmount,
			:cardHolder => data["cc"]["fullName"],
			:cardNumber => data["cc"]["cardNumber"][data["cc"]["cardNumber"].length - 4, data["cc"]["cardNumber"].length],
			:refNum => paymentResult.refNum,
			:avsResult => paymentResult.avsResult,
			:authorization => paymentResult.authCode,
			:cvv2Result => paymentResult.cardCodeResult
		}
	})
	
	# Get saved reservation
	savedReservation = db.find(:_id => reservationID).to_a.first
	
	# Return the payment status
	{
		status: "ok",
		resultCode: paymentResult.resultCode, 
		error: paymentResult.error,
		refNum: paymentResult.refNum,
		reservation: savedReservation
	}.to_json
end

# Get Reservation in month range
get '/reservations/:start_month/:end_month' do
    content_type :json
    # Check for cookie before sending data
    get_reservations_by_month(params[:start_month].to_i, params[:end_month].to_i)
end

get '/reservations' do 
	get_all_reservations
end

get '/reservations/:id' do
	content_type :json
	document_by_id params[:id]
end

delete '/reservations/:id' do 
	content_type :json
	
	# We retain data for analysis
	result = update_by_id(params[:id], {:status => "deleted"});
	status = result[:status] == "deleted" ? "ok" : "error"
	{status: status, deleted: result}.to_json
end