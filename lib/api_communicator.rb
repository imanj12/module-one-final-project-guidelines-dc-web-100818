require 'rest-client'
require 'json'

class ApiCommunicator

    #json_string = RestClient.get('https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=930%20Club&city=Washington&countryCode=US&stateCode=DC')

    #puts json_string
     
    def self.find_by_artist(location,artist)
        city = location.split(", ")[0].gsub(" ", "%20")
        state = location.split(", ")[1]
    	
     	artist.gsub!(" ", "%20")

    	puts "im here too"
    	response_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=#{artist}&city=#{city}&countryCode=US&stateCode=#{state}")
        response_hash = JSON.parse(response_string)

        new_artist = Artist.create(name: response_hash["_embedded"]["events"][0]["name"])
        puts new_artist.name

         

    end

    



end


