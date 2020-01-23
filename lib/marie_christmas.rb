require 'open-uri'
require 'nokogiri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  tds = page.xpath('//td')
  array = []
  
#Exception =>

  begin
    array = tds.select{|td| td.text =~ /.+@.+\.\w+/}
  rescue => exception
  end
  
  if array.length > 0
    return array[0].text.strip
  else
    return ""
  end
  
end

def get_townhalls_urls

  links = {}
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  table = page.xpath('//a[@class="lientxt"]')
  table.each{ |link|
    
     name = link.text
     lnk = link.xpath('@href').to_s
     lnk_formatted = lnk.sub('.', 'http://annuaire-des-mairies.com')
     links[name.downcase.strip.gsub(' ', '_')] = lnk_formatted
    }
    links
end

def get_all_emails
  emails = []
  townhalls_urls = get_townhalls_urls()
  townhalls_urls.each{|key, value|
    mail = get_townhall_email(value)
    h = Hash.new
    h[key] = mail
    emails.push(h)
  }
  return emails
end
p get_all_emails