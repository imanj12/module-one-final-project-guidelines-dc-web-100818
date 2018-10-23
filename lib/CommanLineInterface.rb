require 'pry'
class CommandLineInterface

  def greet
    puts "Hello! Welcome to Eventster, your local area concert finder."
    puts "What would you like to do?"
      puts "1. Learn more about Eventster."
      puts "2. Search for shows near you by artist."
      puts "3. Search for shows near you by venue."
      puts "4. Search for shows by genre."
      puts "5. Show all shows near you within a certain time period."
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
      venue = gets.strip
      puts "What city is it in? e.g. <Washington, DC>"
      location = gets.strip
      find_by_venue(location, venue)
    elsif input == "4"
      puts "Which genre?"
      genre = gets.strip
      puts "Where are you looking for shows? e.g. <Washington, DC>"
      location = gets.strip
      find_by_genre(location, genre)
    elsif input == "5"
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

  # greet option 2 methods
  def find_by_artist(location, artist)
    events = Event.all.select do |ev|
      (artist == ev.artist.name) && (location == ev.venue.location)
    end

    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date}"
    end
  end

  # greet option 3 methods
  def find_by_venue(location, venue)
    events = Event.all.select do |ev|
      (venue == ev.venue.name) && (location == ev.venue.location)
    end

    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date}"
    end
  end

  # greet option 4 methods
  def find_by_genre(location, genre)
    events = Event.all.select do |ev|
      (genre == ev.artist.genre) && (location == ev.venue.location)
    end

    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date}"
    end
  end




end
