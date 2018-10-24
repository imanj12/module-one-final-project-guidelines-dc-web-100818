require 'pry'
class CommandLineInterface

  def greet
    puts TTY::Font.new(:doom).write("Eventster")
    puts "Hello! Welcome to Eventster, your local area concert finder."
    puts "What would you like to do?"
      puts "1. Learn more about Eventster."
      puts "2. Search for shows by artist and city."
      puts "3. Search for shows by venue and city."
      puts "4. Search for shows by genre and city."
      puts "5. Show all shows near you within a certain time period."
      puts "6. Exit program."
      input = gets.strip #strip gets rid of whitespace before and after user input
      input
  end

  def greet_input(input)
    if input == "1" # gets is always a string
      puts "readme"
      input = greet # implement "done reading?" feature
      greet_input(input)

    # 2. Search for shows near you by artist.
    elsif input == "2"
      puts "In what city would you like to search? e.g. <Washington, DC>"
      location = gets.strip
      puts "Which artist would you like to search by?"
      artist = gets.strip
      # query api, save to database, return array of all relevant events
      events = find_by_artist(location, artist)
      show_events(events)
      greet_input(greet) # added cli streamlined method to end of every option

    # 3. Search for shows near you by venue.
    elsif input == "3"
      puts "What is the name of the venue?"
      venue = gets.strip
      puts "What city is it in? e.g. <Washington, DC>"
      location = gets.strip
      events = find_by_venue(location, venue)
      filter_price(events)
      greet_input(greet) # added cli streamlined method to end of every option

    # 4. Search for shows by genre.
    elsif input == "4"
      puts "What is the genre?"
      genre = gets.strip
      puts "In what city would you like to search? e.g. <Washington, DC>"
      location = gets.strip
      events = find_by_genre(location, genre)
      filter_price(events)
      greet_input(greet) # added cli streamlined method to end of every option

    # 5. Show all shows near you within a certain time period.
    elsif input == "5"
      puts "Where do you live? e.g. <Washington, DC>"
        location = gets.strip
      puts "1. See all shows in the current month"
        date = gets.strip
      puts "2. See all shows in the next month"
        date = gets.strip
      puts "3. Define your own custom time period in days or months"
        date = gets.strip

    elsif input == "6"
      exit
    else
      greet_input(greet)
    end
  end

  # greet option 2 method
  def find_by_artist(location, artist)
    ApiCommunicator.find_by_artist(location, artist)
    Event.all.select do |ev|
      (artist.downcase == ev.artist.name.downcase) && (location.downcase == ev.venue.location.downcase)
    end
  end

  # greet option 3 method
  def find_by_venue(location, venue)

    events = Event.all.select do |ev|
      (venue == ev.venue.name) && (location == ev.venue.location)
    end
  end

  # greet option 4 method
  def find_by_genre(location, genre)
    events = Event.all.select do |ev|
      (genre == ev.artist.genre) && (location == ev.venue.location)
    end
  end

  # show events helper method
  def show_events(events)
    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date} -- $#{ev.price}"
    end
  end

end
