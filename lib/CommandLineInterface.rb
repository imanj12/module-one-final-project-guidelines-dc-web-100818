require 'pry'
class CommandLineInterface

  def greet
    puts TTY::Font.new(:doom).write("Eventster")
    puts "Hello! Welcome to Eventster, your cli-based concert search engine."
    puts "What would you like to do?"
      puts "1. Learn more about Eventster."
      puts "2. Search for shows by artist and city."
      puts "3. Search for shows by venue and city."
      puts "4. Search for shows by genre and city."
      # puts "5. Show all shows near you within a certain time period."
      puts "5. Exit program."
      input = gets.strip #strip gets rid of whitespace before and after user input
      input
  end

  def greet_input(input)
    if input == "1" # gets is always a string
      puts
      puts "Eventster is a national concert finder. Please view the README on GitHub for more information. This is a CLI-based application and as such, is somewhat limited in functionality. The goal of this project is to demonstrate CLI-based functionality with a RUBY core, while querying the TicketMaster API and saving results in a database.".colorize(:green)
      puts
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
      # check to see if event is empty, if so don't run filtr price method
      if events.length > 0
        filter_price(events)
      end
      # show_events(events)
      greet_input(greet) # added cli streamlined method to end of every option

    # 3. Search for shows near you by venue.
    elsif input == "3"
      puts "What is the name of the venue?"
      venue = gets.strip
      puts "What city is it in? e.g. <Washington, DC>"
      location = gets.strip
      events = find_by_venue(location, venue)
      # check if any events were returned
      if events.length > 0
        filter_price(events)
      else
        puts
        puts "No shows at that venue found!".colorize(:red)
        puts
      end
      greet_input(greet) # added cli streamlined method to end of every option

    # 4. Search for shows by genre.
    elsif input == "4"
      puts "What is the genre?"
      genre = gets.strip
      puts "In what city would you like to search? e.g. <Washington, DC>"
      location = gets.strip
      events = find_by_genre(location, genre)
      # check if any events were returned
      if events.length > 0
        filter_price(events)
      else
        puts
        puts "No shows of that genre found!".colorize(:red)
        puts
      end
      greet_input(greet) # added cli streamlined method to end of every option

    # 5. Show all shows near you within a certain time period.
    # elsif input == "5"
    #   puts "Where do you live? e.g. <Washington, DC>"
    #     location = gets.strip
    #   puts "1. See all shows in the current month"
    #     date = gets.strip
    #   puts "2. See all shows in the next month"
    #     date = gets.strip
    #   puts "3. Define your own custom time period in days or months"
    #     date = gets.strip

  elsif input == "5"
      exit
    else
      greet_input(greet)
    end
  end

  # greet option 2 method
  def find_by_artist(location, artist)
    ApiCommunicator.find_by_artist(location, artist)

    Event.all.select do |ev|
      # binding1.pry
      (artist.downcase == ev.artist.name.downcase) && (location.downcase == ev.venue.location.downcase)
    end
  end

  # greet option 3 method
  def find_by_venue(location, venue)
    events = Event.all.select do |ev|
      (venue.downcase == ev.venue.name.downcase) && (location.downcase == ev.venue.location.downcase)
    end
  end

  # greet option 4 method
  def find_by_genre(location, genre)
    events = Event.all.select do |ev|
      # binding.pry
      if ev.artist.genre == nil
        ev.artist.genre = "no genre found"
        ev.artist.save
      end
      (genre.downcase == ev.artist.genre.downcase) && (location.downcase == ev.venue.location.downcase)
    end
  end

  # show events helper method
  def show_events(events)
    puts
    puts "Note: If prices for a given event are shown as $0, then prices could not be found! It doesn't mean the event is free!".colorize(:blue)
    puts
    events.each do |ev|
      puts "#{ev.artist.name} at #{ev.venue.name} doors open #{ev.date} -- $#{ev.price}".colorize(:red)
    end
    puts
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
