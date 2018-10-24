require 'rest-client'
require 'json'

class ApiCommunicator

    #json_string = RestClient.get('https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=930%20Club&city=Washington&countryCode=US&stateCode=DC')

    #puts json_string
     
    def self.find_by_artist(location,artist)
        city = location.split(", ")[0].gsub(" ", "%20")
        state = location.split(", ")[1]
    	
     	artist.gsub!(" ", "%20")

    	# puts "im here too"
    	response_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=#{artist}&city=#{city}&countryCode=US&stateCode=#{state}")
        response_hash = JSON.parse(response_string)

        response_hash["_embedded"]["events"].each do |event|
        	new_artist = Artist.create(name: event["name"])
        	city = event["_embedded"]["venues"][0]["city"]["name"]
        	state = event["_embedded"]["venues"][0]["state"]["stateCode"]

        	location = city + ', ' + state
        	new_venue = Venue.create(name: event["_embedded"]["venues"][0]["name"], location: location)
        	event_time = event["dates"]["start"]["localTime"]
        	event_date = event["dates"]["start"]["localDate"]
        	event_date_time = event_time + ', ' + event_date
        	new_event = Event.create(date: event_date_time, artist: new_artist, venue: new_venue, price: 75)
        	puts new_artist.name
        	puts new_venue.name
        	puts new_venue.location
        	puts new_event.date
        	puts new_event.artist.name
        	puts new_event.venue.name
        	

        end

        # new_artist = Artist.create(name: response_hash["_embedded"]["events"][0]["name"])
        # puts new_artist.name
        # venue_name = response_hash["_embedded"]["events"][0]["_embedded"]["venues"][0]["name"]
        # new_venue = Venue.create(name: venue_name, location: "nowhere")

        


         

    end

    



end


