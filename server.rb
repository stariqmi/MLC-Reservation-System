# Ruby gems
require 'sinatra'
require 'json'
require 'mongo'
require 'thin'

# configuration
require "./config"
require "./usaepay"

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


helpers do
	# a helper method to turn a string ID
	# representation into a BSON::ObjectId
	def object_id val
		begin
			BSON::ObjectId.from_string(val)
		rescue BSON::ObjectId::Invalid
			nil
		end
	end
	
	def document_by_id id
		id = object_id(id) if String === id
		if id.nil?
			{}.to_json
		else
			document = settings.mongo_db.find(:_id => id).to_a.first
			(document || {}).to_json
		end
	end
	
	def update_by_id(id, update)
		id = object_id(id) if String === id
		if id.nil?
			{}.to_json
		else
			document = settings.mongo_db.find_one_and_update({:_id => id}, {'$set' => update})
			document
		end
	end
  
  def get_reservations_by_month(start_month, end_month)
      documents = settings.mongo_db.find(:pickup_month => {:$gte => start_month, :$lte => end_month}).to_a
      (documents || {}).to_json
  end
end

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
		savedReservation = db.find(:_id => result.inserted_id).to_a.first
		
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
	
	# Update status of reservation
	status = paymentResult.resultCode == 'E' ? "payment-declined" : "payment-accepted"
	update = update_by_id(result.inserted_id, {:status => status})
	
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

get '/reservations/:id' do
	content_type :json
	document_by_id params[:id]
end
