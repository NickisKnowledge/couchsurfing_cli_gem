# Place class handels on geographical data returned from Scraper class
class Couchsurfing::Place
  attr_accessor :continents, :countries, :cities, :locations, :continent, \
                :country, :city

  def initialize
    @continents = []
    z = Couchsurfing::Scraper.new
    @locations = z.scrape_locations
    @locations.each { |location| @continents.sort! << location['continent'] }
  end

  def continent_selection(num)
    i = num - 1
    @continent = @continents[i]
    select_countries(@continent)
  end

  def select_countries(choice_c)
    @countries = []

    @hash = @locations.select { |location| location['continent'] == choice_c }

    @hash[0]['provinces'].each { |hash| @countries << hash['country'] }

    @countries = @countries.sample(5).sort!
  end

  def country_selection(num)
    i = num - 1
    @country = @countries[i]
    select_cities(@country)
  end

  def select_cities(choice_c)
    hash = @hash[0]['provinces']
    hash.select { |c| @cities = c['cities'] if c['country'] == choice_c }

    @cities = @cities.sample(5).sort!
  end

  def city_selection(num)
    i = num - 1
    @city = @cities[i]
  end
end
