require_relative "../lib/artist.rb"
require_relative "../lib/venue.rb"
require_relative "../lib/event.rb"


drake = Artist.create(name: "Drake")
adele = Artist.create(name: "Adele")
wu_tang = Artist.create(name: "Wu-Tang Clan")
the_knife = Artist.create(name: "The Knife")

nine_thirty = Venue.create(name: "9:30 Club", location: "Washington, DC")
dc_nine = Venue.create(name: "DC9", location: "Washington, DC")
black_cat = Venue.create(name: "Black Cat", location: "Washington, DC")
verizon_center = Venue.create(name: "Verizon Center", location: "Washington, DC")

Event.create(date: "7:00 PM 10/30/18", artist: drake, venue: nine_thirty)
Event.create(date: "6:00 PM 12/15/2018", artist: adele, venue: dc_nine)
Event.create(date: "8:00 PM 1/12/2019", artist: wu_tang, venue: black_cat)
Event.create(date: "9:00 PM 11/25/18", artist: the_knife, venue: verizon_center)
