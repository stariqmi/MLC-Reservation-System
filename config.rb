class ServerConfig
    
    attr_reader :thinPort, :mongoHost, :mongoUrl, :mongoDB, :env, :usaEpayKey, :usaEpayPin
    
    # Initialize instance variables that define server configuration
    def initialize
        # Thin Server configuration
        @thinPort = 3458
        @env = :development
        
        # MongoDB configuration
        @mongoHost = "localhost"
        @mongoPort = "27017"


    	# Development DB
    	@mongoDevUrl = "mongodb://root:root@ds023408.mlab.com:23408"
    	@mongoDevDB = "mlcdevelopment"
            
    	# Use Dev DB
    	@mongoUrl = @mongoDevUrl
    	@mongoDB = @mongoDevDB
        
        @usaEpayKey = "tqgAND730mEqFY22B7Tmf2mno7mvV7aR"
        @usaEpayPin = "9999"
    end
end
