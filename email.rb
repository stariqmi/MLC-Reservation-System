require 'erb'
require 'rest-client'

class EmailService
    
    def initialize apiKey
        @apiKey = apiKey
    end
    
    def send reservation, transaction
        
        @pickup_date = reservation["pickup_date"]
        @pickup_time = reservation["pickup_time"]
        @amount = transaction.nil? ? 0 : transaction.amount
        @html = ""
        
        File.open('./templates/customer.erb', 'rb') do |file|
            template = file.read
            @html = ERB.new(template).result(binding)
        end
        
        # MailGun Api URL
        url = "https://api:" + @apiKey + "@api.mailgun.net/v3/miamilimocoachreservations.com/messages"
        
        RestClient.post url, {
            :from => "Miami Limo Coach <mailgun@miamilimocoachreservations.com>",
            :to => reservation["email"] + ", info@miamilimocoach.com",
            :subject => "Miami Limo Coach Reservation",
            :text => "Testing some Mailgun awesomness!",
            :html => @html
        }
    end
    
end