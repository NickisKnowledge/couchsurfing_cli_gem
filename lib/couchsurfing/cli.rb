class Couchsurfing::CLI

  def start
    begin
      info = get_continents
      get_city_and_state(info)
    end while info != "exit"
    exit_message
  end

  def get_continents
    puts "Select the number with the continent you would like to visit:\nType 'exit' to quite the program."
    puts <<-DOC.gsub /^\s*/, ''
    1. Asia
    2. Africa
    3. Antarctica
    4. Australia
    5. Europe
    6. North America
    7. South America
    DOC
    input = gets.strip
  end

  def get_city_and_state(input)
    @places = Couchsurfing::Place.all
    puts "Select the number of the place for which you would like to view housing accommodations?" if input != 'exit'
    case input
    when '1'
      puts "Choose one of these homes in [Asia]"
    when '2'
      puts "Choose one of these homes in [Africa]"
    when '3'
      puts "Choose one of these homes in [Antarctica]"
    when '4'
      puts "Choose one of these homes in [Australia]"
    when '5'
      puts "Choose one of these homes in [Europe]"
    when '6'
      puts "Choose one of these homes in [North America]"
    when '7'
      puts "Choose one of these homes in [South America]"
    end
  end

    def exit_message
      puts 'Enjoy your new temporary home.'
    end

end
