class Couchsurfing::CLI

  def start
    get_continents
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
    get_city_and_state(input)
  end

  def get_city_and_state(input)
    if input == 'exit'
      stop_surfing
    else
      puts "Select the number of the place for which you would like to view housing accommodations?"
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
  end

    def stop_surfing
      puts 'Enjoy your new temporary home.'
    end

end
