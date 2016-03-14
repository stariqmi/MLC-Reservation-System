class ServerConfig
    
    attr_reader :thinPort, :mongoUrl, :mongoDB, :env, :usaEpayKey, :usaEpayPin
    
    # Initialize instance variables that define server configuration
    def initialize
        # Thin Server configuration
        @thinPort = 3458
        @env = :production

    	# Development DB
    	mongoDevUrl = "mongodb://root:root@ds023408.mlab.com:23408"
    	mongoDevDB = "mlcdevelopment"
        
        # Production DB
        mongoUrl = "mongodb://root:root@ds015209-a0.mlab.com:15209"
        mongoDB = "mlcproduction"
            
    	# # Use Dev DB
    	# @mongoUrl = mongoDevUrl
    	# @mongoDB = mongoDevDB
        
        # Use Production DB
        @mongoUrl = mongoUrl
        @mongoDB = mongoDB
    
        
        # @usaEpayKey = "_JYPW26imL8vZUFNU0wdnHqRlbBANZwK" # Development Key
        @usaEpayKey = "tqgAND730mEqFY22B7Tmf2mno7mvV7aR" # Production Key
        @usaEpayPin = "9999"
    end
end
