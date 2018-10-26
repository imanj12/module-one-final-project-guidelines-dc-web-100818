describe 'Venue' do

  it "has a name and location" do
  @venue = Venue.create(name: "The Spot", location: "Where it's at")
  expect(Venue.find_by(name: "The Spot", location: "Where it's at")).to eq(@venue)
  puts "Venue has a name and location"
  end
end
