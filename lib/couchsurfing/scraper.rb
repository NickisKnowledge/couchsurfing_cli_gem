require 'nokogiri'
require 'open-uri'
require 'pry'

class Couchsurfing::Scraper

  def scrape_locations
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
    locations
  end

  def get_host_pages(continent, country, city)
    url = 'https://www.couchsurfing.com/places/' \
          + continent + '/' + country + '/' + city

    doc = Nokogiri::HTML(open(url))
    host_info = doc.css('div.multicolumn.mod-flex.mod-wrap')

    hosts = []
    host_info.css('a.text.mod-truncated.mod-black.mod-w-90').each do |info|
      host = {}
      host['name'] = info.text.strip.split("\n").join
      host['url'] = info['href']
      hosts << host
    end
    hosts
  end

  def scrape_host_page(host_url)
    url = 'https://www.couchsurfing.com' + host_url
    doc = Nokogiri::HTML(open(url))
    # 'https://www.couchsurfing.com/people/susanne-fischer-2' # bad profile
    # 'https://www.couchsurfing.com/people/damon-page' # no opening info
    # 'https://www.couchsurfing.com/people/davor-medaric' # --reason 4 add code
    # 'https://www.couchsurfing.com/people/mohcine-lar' # chatty-katy
    # 'https://www.couchsurfing.com/people/davidsalib' # chatty-katy-> include
    # 'https://www.couchsurfing.com/users/1005022110' # -- random Male
    # 'https://www.couchsurfing.com/people/asmae-attif' # -- female

    host = []
    profile = {}

    host_name = doc.css('div.profile-sidebar__user-info span a span').text
    profile['name'] = host_name

    z = doc.css('section:nth-child(3) div div div:nth-child(1) ul li:nth-child(3)').text
    profile['age_sex'] = z

    about_me_section = doc.css('div:nth-child(5) section:nth-child(4) div')

    person = {}
    profile['about_me'] = person

   if about_me_section.css('p:nth-child(2)').text == ''
     person['About Me'] = about_me_section.css('p:nth-child(1)').text
   else
     person['About Me'] = about_me_section.css('p:nth-child(1)').text + ": " \
                          + about_me_section.css('p:nth-child(2)').text unless \
                          about_me_section.css('p:nth-child(1)').text == ''
   end

    about_me_section.search('h2').each do |node|
      if (node.next_element.text).include?('COUCHSURFING')
        person[node.text] = node.next_element.text + ': ' + node.next_element.next_element.text
      else
        person[node.text] = node.next_element.text if node.next_element.text != ''
      end
    end
    host << profile
  end

end

 # x = Couchsurfing::Scraper.new
 # x.scrape_get_host_pages('asia', 'south-korea', 'busan')
