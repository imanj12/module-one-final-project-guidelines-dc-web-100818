describe 'Event' do

  let (:test_artist) {Artist.new(name: "Test Artist", genre: "Test genre")}
  let (:test_venue) {Venue.new(name: "Some dope joint", location: "Some dope place, DC")}

  it "has an artist, venue, date and price" do
    @event = Event.create(date: "18:00:00, 11/12/19", venue: test_venue, artist: test_artist, price: 3.50)
    expect(Event.find_by(date: "18:00:00, 11/12/19", venue: test_venue, artist: test_artist, price: 3.50)).to eq(@event)
    puts "Event has an artist, venue, date and price"
  end

end
