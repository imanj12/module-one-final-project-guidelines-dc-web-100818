describe 'Artist' do

  it "has a name and genre" do
    @artist = Artist.create(name: "Test Artist", genre: "Test Genre")
    expect(Artist.find_by(name: "Test Artist", genre: "Test Genre")).to eq(@artist)
    puts 'Artist has a name and genre'
  end

end
