class Couchsurfing::CLI

  def start
    begin
      prompt_for_continents
      info = get_continents
      info == 'exit' || info.scan(/^[\d]+$/).any? ? prompt_for_housing(info) : invalid
      get_city_and_state(info) if info.to_i.to_s == info
    end while info != 'exit'
    exit_message
  end

  def prompt_for_continents
    puts "Select the number with the continent you would like to visit:\n" \
    "Type 'exit' to quite the program.\n\n"
  end

  def get_continents
    @places = Couchsurfing::Place.all
    # add '(1)' so idx will start @ 1 instead of 0, so don't need 2 do 'i + 1'
    @places.each.with_index(1) do |place, i|
      puts "#{i}. #{place.continent}"
    end

    input = gets.strip.downcase
  end

  def prompt_for_housing(input)
    puts "You selected #{input}\n"
    puts "Select the number of the place for which you would like to view " \
    "housing accommodations in:\n\n" if input != 'exit'
  end

  def get_city_and_state(input)
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
    else
      invalid
    end
  end

  def exit_message
    puts 'Enjoy your new temporary home.'
  end

  def invalid
    puts "Your selection was invalid. Please choose a number from the list.\n\n"
  end

end
