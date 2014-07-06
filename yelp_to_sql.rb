require 'SQLite3'
module BarCrawl
	def self.setup
		$db = SQLite3::Database.new( 'barcrawl.db' )

		$db.execute <<-SQL
  			DROP TABLE IF EXISTS bars;
		SQL

		$db.execute <<-SQL
		  DROP TABLE IF EXISTS crawlers;
		SQL
		
		$db.execute <<-SQL

		  CREATE TABLE bars (
		   id INTEGER PRIMARY KEY AUTOINCREMENT,
		   bar_name VARCHAR(64),
		   rating REAL,
		   address VARCHAR(100),
		   zip INTEGER	
		  );

		SQL
		$db.execute <<-SQL

		  CREATE TABLE crawlers (
		   id INTEGER PRIMARY KEY AUTOINCREMENT,
		   cell INTEGER,
	 	   username VARCHAR,
	 	   zip INTEGER	
		  );

		SQL
	end
end

BarCrawl.setup

