require 'pry'
class CommandLineInterface

  def greet
    puts TTY::Font.new(:doom).write("Eventster")
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
      input = greet # implement "done reading?" feature
      greet_input(input)

    # 2. Search for shows near you by artist.
    elsif input == "2"
      puts "Where do you live? e.g. <Washington, DC>"
      location = gets.strip
      puts "Which artist would you like to search by"
      artist = gets.strip
      events = find_by_artist(location, artist)
      filter_price(events)
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
      puts "Which genre?"
      genre = gets.strip
      puts "Where are you looking for shows? e.g. <Washington, DC>"
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
    end
  end

  # show events helper method
  def show_events(events)
    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date} -- $#{ev.price}"
    end
  end

  # greet option 2 method
  def find_by_artist(location, artist)
    events = Event.all.select do |ev|
      (artist == ev.artist.name) && (location == ev.venue.location)
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

  # filter price methods
  def filter_price(events)
  puts "Would you like to filter by price? (y/n)"
  yes_no = gets.strip
    if yes_no == "y"
      puts "Please input a maximum price"
      price = gets.strip
      filter_by_price(events, price)
    else
      show_events(events)
    end
  end

  # filter price helper method
  def filter_by_price(events, price)
    events_price = events.select do |ev|
      ev.price <= price.to_f
    end
    show_events(events_price)
  end


end
