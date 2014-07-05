require 'yelp'
require 'SQLite3'
# load 'controller.rb'

$db = SQLite3::Database.open( 'barcrawl.db' )


consumer_key = 'bfWEoo4IOk7BAooDHvLoAA'
consumer_secret = '5JxVclhb22smmLQf29LgApMFu4s'
token = 'jBafeQSXWX5NjUVnSdD9iLEH1yRMBUOB'
token_secret = '36GnODrWGkB1H2pmtgbakm-X3tc'


client = Yelp::Client.new({ consumer_key: consumer_key,
                            consumer_secret: consumer_secret,
                            token: token,
                            token_secret: token_secret
                          })

params = { term: 'nightlife',
           limit: 5,
           category_filter: 'bars', 
           sort: 2
         }

response = client.search('New York', params)

# p response.display_address.postal_code

# response.businesses.each do |i|
# 	puts i.location.display_address[2].split(' ').pop
# 	# puts i.location.display_address
# 	# puts i.location.neighborhoods
# end

response.businesses.each do |bar|


	$db.execute("INSERT INTO bars (bar_name, rating, address, zip)
            VALUES (?, ?, ?, ?)", [bar.name, bar.rating, bar.location.display_address.join(', '), bar.location.display_address[2].split(' ').pop])
end













