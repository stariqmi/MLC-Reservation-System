class ServerConfig
    
    attr_reader :thinPort, :mongoHost, :mongoUrl, :mongoDB, :privateKeyFile, :certChainFile
    
    # Initialize instance variables that define server configuration
    def initialize
        # Thin Server configuration
        @thinPort = 3458
        
        # MongoDB configuration
        @mongoHost = "localhost"
        @mongoPort = "27017"

	# Development DB
	@mongoDevUrl = "mongodb://root:root@ds023408.mlab.com:23408"
	@mongoDevDB = "mlcdevelopment"
        
	# Use Dev DB
	@mongoUrl = @mongoDevUrl
	@mongoDB = @mongoDevDB
    end
end
