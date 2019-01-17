require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  crypto_name = []
  crypto_value = []

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  doc.css('table > tbody > tr > td > span > a').each do |node|
    crypto_name << node.text
  end

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  doc.css('a').css('.price').each do |node|
    crypto_value << node.text[1..-1].to_f
  end

  crypto_hash = Hash[crypto_name.zip(crypto_value)]
end
