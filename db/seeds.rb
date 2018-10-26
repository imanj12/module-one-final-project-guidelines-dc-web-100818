require_relative "../lib/artist.rb"
require_relative "../lib/venue.rb"
require_relative "../lib/event.rb"

Artist.destroy_all
Venue.destroy_all
Event.destroy_all

drake = Artist.create(name: "Drake", genre: "hip/hop")
adele = Artist.create(name: "Adele", genre: "r&b")
wu_tang = Artist.create(name: "Wu-Tang Clan", genre: "hip/hop")
the_knife = Artist.create(name: "The Knife", genre: "electronic")
trentemoller = Artist.create(name: "Trentemoller", genre: "electronic")
playboi_carti = Artist.create(name: "Playboi Carti", genre: "hip/hop")
m83 = Artist.create(name: "M83", genre: "electronic")
health = Artist.create(name: "HEALTH", genre: "electronic")
t_swift = Artist.create(name: "Taylor Swift", genre: "pop")
dua_lipa = Artist.create(name: "Dua Lipa", genre: "pop")
vybz_kartel = Artist.create(name: "VyBz Kartel", genre: "hip/hop")
black = Artist.create(name: "6lack", genre: "hip/hop")

nine_thirty = Venue.create(name: "9:30 Club", location: "Washington, DC")
dc_nine = Venue.create(name: "DC9", location: "Washington, DC")
black_cat = Venue.create(name: "Black Cat", location: "Washington, DC")
verizon_center = Venue.create(name: "Verizon Center", location: "Washington, DC")

Event.create(date: "19:00:00, 10/30/18", artist: drake, venue: nine_thirty, price: 20.00)
Event.create(date: "18:00:00, 12/15/2018", artist: adele, venue: dc_nine, price: 40.00)
Event.create(date: "20:00:00, 01/12/2019", artist: wu_tang, venue: black_cat, price: 35.00)
Event.create(date: "21:00:00, 11/25/18", artist: the_knife, venue: verizon_center, price: 50.00)
Event.create(date: "19:00:00, 01/19/19", artist: trentemoller, venue: verizon_center, price: 40.00)
Event.create(date: "23:00:00, 12/24/18", artist: playboi_carti, venue: dc_nine, price: 30.00)
Event.create(date: "16:00:00, 04/10/19", artist: m83, venue: dc_nine, price: 70)
Event.create(date: "21:00:00, 03/30/19", artist: health, venue: nine_thirty, price: 40.00)
Event.create(date: "23:00:00, 02/04/19", artist: t_swift, venue: verizon_center, price: 100.00)
Event.create(date: "22:00:00, 06/06/19", artist: dua_lipa, venue: black_cat, price: 40.00)
Event.create(date: "23:00:00, 03/25/18", artist: vybz_kartel, venue: black_cat, price: 60.00)
Event.create(date: "00:00:00 05/22/19", artist: black, venue: nine_thirty, price: 30.00)
