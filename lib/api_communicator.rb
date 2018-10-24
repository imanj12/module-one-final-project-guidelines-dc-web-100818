require 'rest-client'
require 'json'

class ApiCommunicator

    #json_string = RestClient.get('https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=930%20Club&city=Washington&countryCode=US&stateCode=DC')

    #puts json_string

    def self.get_parse(location,artist)
        puts city = location.split(", ")[0].gsub(" ", "%20")
    	puts state = location.split(", ")[1]
    	
     	artist.gsub!(" ", "%20")

    	
    	response_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=#{artist}&city=#{city}&countryCode=US&stateCode=#{state}")
        response_hash = JSON.parse(response_string)

        puts response_hash

    end



end

ApiCommunicator.get_parse("Washington, DC","Wild Nothing")
