require 'erb'
require 'rest-client'
require 'json'

class EmailService
    
    def initialize apiKey
        @apiKey = apiKey
    end
    
    def send(to_who, reservation)
        
        @reservation = reservation
        @transaction = reservation[:transaction]
        
        file = File.new("../js/form_specs/" + reservation[:form_type] + ".json")
        @json = JSON.parse(file.read)
        html = ''
        
        File.open('./templates/reservation.erb', 'rb') do |file|
            template = file.read
            html = ERB.new(template).result(binding)
        end
        
        # MailGun Api URL
        url = "https://api:" + @apiKey + "@api.mailgun.net/v3/miamilimocoachreservations.com/messages"
        
        RestClient.post url, {
            :from => "Miami Limo Coach <mailgun@miamilimocoachreservations.com>",
            :to => to_who == "customerAndOleg" ? reservation["email"] + ", info@miamilimocoach.com" : to_who,
            :subject => "Miami Limo Coach Reservation (#{reservation[:status]})",
            :html => html
        }
    end
    
end