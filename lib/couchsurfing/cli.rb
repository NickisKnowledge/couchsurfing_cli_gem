# CLI controller deals with user interactions
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
      info = host(info) unless info == 'exit' || info == 'error'
      reading_time unless info == 'exit' || info == 'error'
    end while info != 'exit'
    exit_message
  end

  def prompt_for_continents
    puts "Select a number with the continent you would like to visit.\n" \
    "Type 'exit' to quit the program.\n\n"
  end

  def get_continents
    prompt_for_continents
    z = display_continents
    info = get_info(z)
  end

  def get_info(int)
    info = gets.strip.downcase
    return info if info == 'exit'
    info = info.to_i if info.scan(/^[\d]+$/).any?
    return info if (1..int).cover?(info)
    invalid
    'error'
  end

  def display_continents
    @places.continents.each.with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end
    puts "\n"

    @places.continents.count
  end

  def get_countries(input)
    @places.continent_selection(input)
    prompt_for_countries
    z = display_countries
    info = get_info(z)
  end

  def prompt_for_countries
    puts "\nChoose the number of the country you would like to tour, " \
           "or type exit.\n\n"
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
    puts "\nPick a number with the city you want to explore, or type exit.\n\n"
  end

  def display_cities
    @places.cities.each_with_index do |c, i|
      puts "#{i + 1}. #{c}"
    end
    puts "\n"

    @places.cities.count
  end

  def get_hosts(input)
    @places.city_selection(input)
    prompt_for_hosts
    z = display_hosts
    info = get_info(z)
  end

  def prompt_for_hosts
    puts "\nPlease wait while we find your hosts or type exit.\n\n"
  end

  def display_hosts
    @comperes = Couchsurfing::Host.new(@places)
    puts "Enter the number of the name that interests you, or type exit.\n\n"
    @comperes.hosts_selection.each_with_index do |name, i|
      puts "#{i + 1}. #{name.split.map(&:capitalize) * ' '}"
    end
    puts "\n"

    @comperes.hosts_selection.count
  end

  def host(input)
    z = @comperes.selected_host(input)
    server_trick if z == []
  end

  def server_trick
    puts "\nI'm sorry the couchsurfing server would not let" \
         " me have information about this person.\n\n"
    sleep 2
    puts "Darn thing can be so uncooperative . . .\n\n"
    sleep 2
    puts "Please select another destination!\n\n"
    sleep 2
    puts "Safe travels!\n\nHope you have a ball!!!  =)  ;-D\n\n\n\n"
    sleep 2
    'error'
  end

  def reading_time
    sleep 10
  end

  def exit_message
    puts "\nHave a great time with your new host =D"
  end

  def invalid
    puts "Your selection was invalid. Please choose a number from the list.\n\n"
  end
end
