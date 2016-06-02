# Ruby Gems
require 'twilio-ruby'

class SMS
    def initialize(sid, auth_token, number)
        @sid = sid
        @auth_token = auth_token
        @number = number
        
        # set up a client to talk to the Twilio REST API 
        @client = Twilio::REST::Client.new sid, auth_token
    end
    
    def send(to, reservation_id) 
        response = @client.account.messages.create({
          :from => @number,
          :to => to, 
          :body => "Reservation Link is https://miamilimocoachreservations.com/#!/reservations/#{reservation_id}" 
        })
        {:error => !(response.error_code.nil?), :body => response.body}
    end
end