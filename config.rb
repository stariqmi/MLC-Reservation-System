class ServerConfig
    
    attr_reader :thinPort, :mongoHost, :mongoPort, :mongoDB, :privateKeyFile, :certChainFile
    
    # Initialize instance variables that define server configuration
    def initialize
        # Thin Server configuration
        @thinPort = 3458
        
        # MongoDB configuration
        @mongoHost = "localhost"
        @mongoPort = "27017"
        @mongoDB = 'MLC'
    end
end
