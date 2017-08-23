# Host class captures and formats host information returned from Scraper
class Couchsurfing::Host
  attr_accessor :hosts, :scraper, :names

  def initialize(obj)
    continent = make_url(obj.continent)
    country = make_url(obj.country)
    city = make_url(obj.city)
    @scraper = Couchsurfing::Scraper.new
    @hosts = @scraper.get_host_pages(continent, country, city)
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

  def selected_host(num)
    i = num - 1
    host = @names[i]
    about_host(host)
  end

  def about_host(choice_h)
    host_info = @hosts.select { |person| person['name'] == choice_h }
    url = host_info[0]['url']

    about_host = @scraper.scrape_host_page(url) unless about_host == []
    about_host.each do |descript|
      puts "\n\nHello as you know my name is #{descript['name']}.\n\n"
      puts "I am a#{descript['age_sex'].split(',')[1]}, who is" \
           "#{descript['age_sex'].split(',')[0]} years old.\n\n"
      descript['about_me'].each { |k, v| puts "#{k}\n#{v.tr("\n", '')}\n\n" }

      puts "You should definitely come stay with me! We'll have a " \
           "blast! ; )\n\n\n\n"
    end
  end
end
