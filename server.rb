# Ruby gems
require 'sinatra'
require 'json'
require 'mongo'
require 'thin'

# configuration
require "./config"

serverConfig = ServerConfig.new

class MyThinBackend < ::Thin::Backends::TcpServer
  def initialize(host, port, options)
    super(host, port)
    @ssl = true
    @ssl_options = options
  end
end

# Configure Sinatra WebService
configure do
	
	# MongoDB setup
	db = Mongo::Client.new([ serverConfig.mongoHost + ':' + serverConfig.mongoPort ], :database => serverConfig.mongoDB)  
    set :mongo_db, db[:reservations]
	
	# SSL Thin Setup
	set :environment, :development
	set :bind, '0.0.0.0'
	set :port, serverConfig.thinPort
	set :server, "thin"
	class << settings
		def server_settings
		  {
		    :backend          => MyThinBackend,
		    # These filenames should be set as ENV variables
			:private_key_file => File.dirname(__FILE__) + "/local.mlc.com.key",
		    :cert_chain_file  => File.dirname(__FILE__) + "/local.mlc.com.key.crt",
		    :verify_peer      => false
		  }
		end
	end
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
  
  def get_reservations_by_month(start_month, end_month)
      documents = settings.mongo_db.find(:pickup_month => {:$gte => start_month, :$lte => end_month}).to_a
      (documents || {}).to_json
  end
end

# Routing Endpoints
get '/' do
	send_file 'index.html'
end

post '/authenticate/:password' do
    # Check password and authenticate it
    pwd = params[:password]
    # Is password correct?
    # If so set cookie
    {status: 0, message: "Authentication failed"}.to_json
end

post '/pre-payment/save' do
	request.body.rewind  # in case someone already read it
	data = JSON.parse request.body.read
	
	content_type :json
	db = settings.mongo_db
	
    result = db.insert_one data
	db.find(:_id => result.inserted_id).to_a.first.to_json
end

post '/process/payment' do
	request.body.rewind
	data = JSON.parse request.body.read
	
	# Call Payment System Ruby API
    content_type :json
	{message: "Thankyou for the payment"}.to_json
end

get '/reservations/:start_month/:end_month' do
    content_type :json
    # Check for cookie before sending data
    get_reservations_by_month(params[:start_month].to_i, params[:end_month].to_i)
end

get '/reservations/:id' do
	content_type :json
	document_by_id params[:id]
end