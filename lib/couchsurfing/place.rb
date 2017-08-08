class Couchsurfing::Place
  attr_accessor :continent, :country, :city

  def self.all
    place_1 = self.new
        place_1.continent = 'Africa'
        place_1.country = 'Egypt'
        place_1.city = 'Cairo'

        place_2 = self.new
        place_2.continent = 'Asia'
        place_2.country = 'China'
        place_2.city = 'Beijing'

        [place_1, place_2]
  end
end
