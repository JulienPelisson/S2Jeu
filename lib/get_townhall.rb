require 'nokogiri'
require 'open-uri'



def get_townhall_email(townhall_url_complete)
	town = []
	email_adress = []

	townhall_url_complete.each do |townhall_url_complete|
		doc = Nokogiri::HTML(open(townhall_url_complete))
		doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
			
			email_adress << node.text
		end
	end

	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	doc.css('a').css('.lientxt').each do |node|

		town << node.text
	end

	return townhall_hash = Hash[town.zip(email_adress)]

end

def get_townhall_url
	townhall_url = []
	townhall_url_complete = []
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	doc.css('a').css('.lientxt').each do |node|

		townhall_url << node['href'][1..-1]
	end

	townhall_url.each do |townhall_url|

		townhall_url_complete << "https://www.annuaire-des-mairies.com#{townhall_url}"
	end	
	townhall_url_complete
end



get_townhall_url
get_townhall_email(get_townhall_url)