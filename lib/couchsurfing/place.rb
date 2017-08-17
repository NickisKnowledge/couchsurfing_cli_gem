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

end

# x = Couchsurfing::Place.new
# p x.continents
