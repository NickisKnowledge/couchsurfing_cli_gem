class Couchsurfing::Place
  attr_accessor :continents, :countries, :cities, :locations

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
    puts @continent
  end
end

# x = Couchsurfing::Place.new
# p x.continents
