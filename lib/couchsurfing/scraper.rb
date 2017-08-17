require 'nokogiri'
require 'open-uri'
require 'pry'

class Couchsurfing::Scraper

  def scrape_location
    doc = Nokogiri::HTML(open('https://www.couchsurfing.com/places'))
          structure = doc.css('#section_places div:nth-child(4) div div' \
                              ' div.pure-u-1.pure-u-md-15-24 div')
    regions = structure.css('.cs-sitemap-region')

    locations = []
    c = structure.css('h2 a').count
    (0...c).each do |i|
      n = 0
      area = {}
      continent = (structure.css('h2 a')[i]).text
      area['continent'] = continent
      countries = (regions[i]).css('h3 a').map(&:text)

      area['provinces'] = []
      countries.map do |country|
        p = {}
        area['provinces'] << p
        c1 = (regions[i]).css("ul:nth-child(#{(n += 2)})").text
        cities = c1.split("\n").collect(&:strip).reject!(&:empty?)

        p['country'] = country
        p['cities'] = cities
      end
      locations << area
    end
    puts locations
  end

  def scrape_get_host_page

  end

  def scrape_host_page

  end
end

# x = Couchsurfing::Scraper.new
# x.scrape_location
