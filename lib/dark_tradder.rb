require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

crypto_names = page.css('//tr/a[@class="cmc-link"]')
puts crypto_names


crypto_currency = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[1]/td[4]/a')




