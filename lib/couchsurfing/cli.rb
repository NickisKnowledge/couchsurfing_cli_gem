class Couchsurfing::CLI

  def start
    get_continents
  end

  def get_continents
    puts "Select the number with the continent you would like to visit:"
    puts <<-DOC.gsub /^\s*/, ''
    1. Asia
    2. Africa
    3. Antarctica
    4. Australia
    5. Europe
    6. North America
    7. South America
    DOC
  end

end
