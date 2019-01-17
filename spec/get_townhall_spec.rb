require_relative '../lib/get_townhall.rb'

describe "the get_townhall_email" do
	it "should return a hash of adress & mail" do 
		expect(town_email_hash).is_a?(Hash)
	end
end

describe "the get_townhall_url" do
	it "should return a hash of valid url" do
		expect(townhall_url_complete).is_a?(Array)
	end
end
