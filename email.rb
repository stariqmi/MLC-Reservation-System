require 'erb'
require 'rest-client'
require 'json'

class EmailService
    
    def initialize apiKey
        @apiKey = apiKey
    end
    
    def send reservation, transaction
        
        @reservation = reservation
        @transaction = transaction
        
        type = reservation["form_type"]
        file = File.new("./js/" + type + ".json")
        @json = JSON.parse(file.read)
        
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