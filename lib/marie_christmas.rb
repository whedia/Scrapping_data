require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

puts townhall_url = page.xpath('//a')


=begin
def get_townhall_email(townhall_url)
    
  end
end

def get_townhall_urls

end
=end
