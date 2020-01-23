require 'nokogiri'
require 'open-uri'


def crypto_name_array()

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  
  cryptos_names = []
  cryptos_values = []

  cryptos = page.xpath('//tr/td[3]/div')
  values = page.xpath('//tr/td[5]/a')
  cryptos.each{|val|
    txt = "#{val.text}"
    cryptos_names.push(txt)
  }
  values.each{|val|
    txt = "#{val.text}".sub(",", "")
    txt[0]=''
    cryptos_values.push(txt.to_f)
  }

  result = Hash[cryptos_names.zip cryptos_values]
  result
end

def proper_format (hash)
  a = []
  hash.each{|key, val|
  h = Hash.new
  h[key] = val
  a.push(h)
  }

  return a
end

p proper_format(crypto_name_array)




