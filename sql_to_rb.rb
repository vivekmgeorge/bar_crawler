require 'sqlite3'
require_relative 'beer_crawl_setup.rb'

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
	  bar_search.each {|owner| Owner.new({first_name: owner[1], last_name: owner[2], email: owner[3]}) }
  end

end

class Crawler
	attr_accessor :cell, :name, :zip

	def initialize(cell, name, zip)
		@cell = cell
		@name = name
		@zip = zip
	end
end