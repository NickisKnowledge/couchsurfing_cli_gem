class Couchsurfing::CLI
  attr_accessor :places

  def initialize
    @places = Couchsurfing::Place.new
  end

  def start
    begin
      info = get_continents
      info = get_countries(info) unless info == 'exit' || info == 'error'
      info = get_cities(info) unless info == 'exit' || info == 'error'
      info = get_hosts(info) unless info == 'exit' || info == 'error'
      host(info) unless info == 'exit' || info == 'error'
    end while info != 'exit'
    exit_message
  end

  def prompt_for_continents
    puts "Select the number with the continent you would like to visit:\n" \
    "Type 'exit' to quite the program.\n\n"
  end

  def get_continents
    prompt_for_continents
    z = display_continents
    info = get_info(z)
  end

  def get_info(int)
    info = gets.strip.downcase
    if info == 'exit'
      return info
    elsif info.scan(/^[\d]+$/).any?
      info = info.to_i
      if (1..int).include?(info)
        return info
      else
        invalid; return 'error'
      end
    else
    invalid; return 'error'
    end
  end

  def display_continents
    @places.continents.each.with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end
    @places.continents.count
  end

  def get_countries(input)
    @places.continent_selection(input)
    prompt_for_countries
    z = display_countries
    info = get_info(z)
  end

  def prompt_for_countries
    puts "\nChoose the number with your desired country you want to " \
           "visit or type exit."
  end

  def display_countries
    @places.countries.each_with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end
    puts "\n"
    @places.countries.count
  end

  def get_cities(input)
    @places.country_selection(input)
    prompt_for_cities
    z = display_cities
    info = get_info(z)
  end

  def prompt_for_cities
    puts "\nSelect the number with the city you want to visit or type exit."
  end

  def display_cities
    # arr = ['Cairo', 'Marrakech', 'Cape Town', 'Tunis']
    @places.cities.each_with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end
    puts "\n"
      @places.cities.count
  end

  def get_hosts(input)
    prompt_for_hosts
    x = display_hosts
    info = get_info(x)
  end

  def prompt_for_hosts
    puts "\nPlease wait while we find your hosts or type exit."
  end

  def display_hosts
    arr = ['Jim', 'Sally', 'Sue']
    arr.each_with_index do |person, i|
      puts "#{i + 1}. #{person}"
    end
    puts "\n"
    arr.count
  end

  def host(input)
    puts "Sue is 32."
    puts 'Sue loves to travel'
    puts 'Sue has 3.5 out of 5 stars.'
    puts "\n\n"
  end


  def exit_message
    puts 'Enjoy your new temporary home.'
  end

  def invalid
    puts "Your selection was invalid. Please choose a number from the list.\n\n"
  end
end
