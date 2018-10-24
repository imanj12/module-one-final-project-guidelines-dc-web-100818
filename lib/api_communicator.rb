require 'rest-client'
require 'json'

class ApiCommunicator

  def self.find_by_artist(location, artist)
    # split city and state for API
    city = location.split(", ")[0].gsub(" ", "%20")
    state = location.split(", ")[1]

    # substitute spaces for %20 character for API
    query_artist_name = artist.gsub(" ", "%20")

    # query API
  	response_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=#{query_artist_name}&city=#{city}&countryCode=US&stateCode=#{state}")
    response_hash = JSON.parse(response_string)

    # loop through response hash and make new artist, event, venue objects
    response_hash["_embedded"]["events"].each do |event|
      # create artist object
      new_artist = Artist.find_or_create_by(name: event["name"])
      # collect city and state from hash and join them
      city = event["_embedded"]["venues"][0]["city"]["name"]
    	state = event["_embedded"]["venues"][0]["state"]["stateCode"]
    	location = city + ', ' + state
      # create new venue
      new_venue = Venue.find_or_create_by(name: event["_embedded"]["venues"][0]["name"], location: location)
      # create event
      event_time = event["dates"]["start"]["localTime"]
    	event_date = event["dates"]["start"]["localDate"]
    	event_date_time = event_time + ', ' + event_date
    	Event.find_or_create_by(date: event_date_time, artist: new_artist, venue: new_venue, price: 75)
    end
  end


end
