class Couchsurfing::Host
  attr_accessor :hosts, :scraper, :names
  # couchsurfing.com/places/africa/morocco/marrakech
  # couchsurfing.com/places/middle-east/united-arab-emirates/dubai1
  def initialize(obj)
    continent = make_url(obj.continent)
    country = make_url(obj.country)
    city = make_url(obj.city)
    @scraper = Couchsurfing::Scraper.new
    @hosts = @scraper.scrape_get_host_pages(continent, country, city)
  end

  def make_url(selection)
    selection.downcase.tr(' ', '-')
  end

  def hosts_selection
    @names = []
    @hosts = @hosts.sample(5)
    @hosts.each do |info|
      @names << info['name']
    end
    @names.sort!
  end
end
