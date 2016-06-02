# Ruby Gems
require 'digest'

# UsaEpay library
# require_relative 'USAePay_ruby_sandbox/usaepayDriver'
require_relative 'USAePay_ruby_live/usaepayDriver'
 
class UsaEpay
    
    def initialize(key, pin)
        @key = key;
        @pin = pin;
    end
    
    def getToken
    	token=UeSecurityToken.new
    	token.clientIP = "123.123.123.123"
    	hash=UeHash.new
    	t=Time.now
    	seed = "#{t.year}#{t.month}#{t.day}#{t.hour}#{rand(1000)}" 
    	prehash = "#{@key}#{seed}#{@pin.to_s.strip}" 
    	hash.seed=seed
    	hash.type="sha1"
    	hash.hashValue=Digest::SHA1.hexdigest(prehash).to_s 
    	token.pinHash = hash 
    	token.sourceKey=@key 
    	return token
    end
    
    # @params hash transaction
    def executeTransaction(transaction)
        reservationID = transaction["reservationID"]
        
        request=TransactionRequestObject.new
        request.accountHolder=transaction["fullName"]
        request.command="sale"
         
        details=TransactionDetail.new
        details.amount=transaction["amount"]
        
        details.description="Miami Limo Coach Reservation ID - #{reservationID}"
        
        request.details=details
         
        creditcard=CreditCardData.new
        creditcard.avsStreet=transaction["streetAddr"]
        creditcard.avsZip=transaction["zip"]
        creditcard.cardNumber=transaction["cardNumber"]
        creditcard.cardExpiration=transaction["expiry"]
        creditcard.cardCode=transaction["cvv2"]
        request.creditCardData=creditcard
        
        @client=UeSoapServerPortType.new
        response=@client.runTransaction(self.getToken ,request)
        response
    end
end