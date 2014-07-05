require_relative 'view.rb'
require_relative 'model.rb'
require 'sqlite3'
require 'twilio-ruby'

$db = SQLite3::Database.open( 'barcrawl.db' )
$account_sid = 'ACa30888b2c139c37fe5687b9f222915e7'
$auth_token = 'f844364e6b636cad7d4e82f7757017c4'

class Controller
	def initialize
		# puts "hi"
		@view = View.new
		# p @view
		get_user_input
	end

	def get_user_input
		get_username
		get_cell
		get_zip
		add_user_to_database
		select_bars_with_matching_zip
		send_sms
	end

	def get_username
		@view.puts_username
		@username = gets.chomp
	end

	def get_cell
		@view.puts_cell
		@cell = gets.chomp
	end

	def get_zip
		@view.puts_zip
		@zip = gets.chomp
	end

	def add_user_to_database
		$db.execute("INSERT INTO crawlers (cell, username, zip)
            VALUES (?, ?, ?)", [@cell, @username, @zip])
	end

	def select_bars_with_matching_zip
		@bars = $db.execute("SELECT * FROM bars WHERE zip = #{@zip};")
	end

	def send_sms
		@client = Twilio::REST::Client.new $account_sid, $auth_token
		@client.account.messages.create(
		  :from => '+13024070199',
		  :to => "+1#{@cell}",
		  :body => "Hey there #{@username}!
		  Go to these bars; #{@bars}" 
		)
	end
end


Controller.new