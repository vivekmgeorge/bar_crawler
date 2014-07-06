require 'sqlite3'
load 'beer_crawl_setup.rb'

class Bar
	attr_accessor :name, :rating, :address

	def initialize(name, rating, address, zip)
		@name = name
		@rating = rating
		@address = address
		@zip = zip
	end

  def get_bars
	  bar_search = $db.execute( "SELECT * FROM bars WHERE zip = crawler.zip ")
  end

end

class Crawler
	attr_accessor :cell, :username, :zip

	def initialize(cell, username, zip)
		@cell = cell
		@username = username
		@zip = zip
	end
end 
