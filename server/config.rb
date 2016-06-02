class ServerConfig
    
    attr_reader :thinPort, :mongoUrl, :mongoDB, :env, 
        :usaEpayKey, :usaEpayPin, :mailgunApiKey,
        :twilioSmsSID, :twilioAuthToken, :twilioNumber
    
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
    
        @mailgunApiKey = "key-abf9a7a4aaf92accf218dc8749e8094c"
        
        # @twilioSID = "SK26d0719fd69e72bdc069420ee8582e4a"
        # @twilioSecret = "Y49tVh4zLYAS257gFTyVWZRcuKBRHhDg"
        
        @twilioSmsSID = "AC57d8696d4d00eaa1cee851e6b9df4db2"
        @twilioAuthToken = "d271a1af407deeaf70615750e2fff682"
        @twilioNumber = "+17862205457"
    end
end
