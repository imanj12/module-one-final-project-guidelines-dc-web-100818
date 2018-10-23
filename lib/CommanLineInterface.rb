class CommandLineInterface

  def greet
    puts "Hello! Welcome to Eventster, your local area concert finder."
    puts "What would you like to do?"
      puts "1. Learn more about Eventster."
      puts "2. Search for shows near you by artist."
      puts "3. Search for shows near you by venue."
      puts "4. Show all shows near you within a certain time period."
      input = gets.strip #strip gets rid of whitespace before and after user input
      input
  end

  def greet_input(input)
    if input == "1" # gets is always a string
      puts "readme"
    elsif input == "2"
      puts "Where do you live? e.g. <Washington, DC>"
      location = gets.strip
      puts "Which artist would you like to search by"
      artist = gets.strip
      find_by_artist(location, artist)
    elsif input == "3"
      puts "What is the name of the venue?"
      venue_name = gets.strip
      puts "What city is it in?"
      location = gets.strip
    elsif input == "4"
      puts "Where do you live? e.g. <Washington, DC>"
        location = gets.strip
      puts "1. See all shows in the current month"
        date = gets.strip
      puts "2. See all shows in the next month"
        date = gets.strip
      puts "3. Define your own custom time period in days or months"
        date = gets.strip
    end
  end

  def find_by_artist(location, artist)
    Event.all.select do |ev|
      if artist == ev.artist.name && location == ev.venue.location
        puts ev
      end
    end
  end
end
