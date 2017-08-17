class Couchsurfing::Place
  attr_accessor :continents, :countries, :cities, :locations, :continent \


  def initialize
    @continents = []
    z = Couchsurfing::Scraper.new
    @locations = z.scrape_locations
    @locations.each do |location|
      @continents.sort! << location['continent']
    end
  end

  def continent_selection(num)
    i = num - 1
    @continent = @continents[i]
    select_countries(@continent)
  end

  def select_countries(choice_c)
    @countries = []

    @selected_hash = @locations.select do |location|
      location['continent'] == choice_c
    end

    @selected_hash[0]['provinces'].each do |hash|
      @countries << hash['country']
    end

    @countries = @countries.sample(5).sort!
  end

  def country_selection(num)
    i = num - 1
    @country = @countries[i]
    select_cities(@country)
  end

  def select_cities(choice_c)
    @selected_hash[0]['provinces'].select do |c|
      @cities = c['cities'] if c['country'] == choice_c
    end
  end
end

# x = Couchsurfing::Place.new
# p x.continents
