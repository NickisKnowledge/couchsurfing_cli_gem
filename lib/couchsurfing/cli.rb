class Couchsurfing::CLI
  def start
    begin
      info = get_continents
      prompt_for_countries unless info == 'exit' || info == 'error'
      get_countries(info) unless info == 'exit' || info == 'error'
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
    # @places = Couchsurfing::Place.all
    arr = ['Africa', 'Asia']
    arr.each.with_index do |place, i|
      puts "#{i + 1}. #{place}"
    end
    arr.count
  end

  def prompt_for_countries
    puts "Select the number of the place for which you would like to view " \
    "housing accommodations in:\n\n"
  end

  def get_countries(input)
    puts 'Where countries will be displayed.'
  end

  def exit_message
    puts 'Enjoy your new temporary home.'
  end

  def invalid
    puts "Your selection was invalid. Please choose a number from the list.\n\n"
  end
end
