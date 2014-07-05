require 'yelp'


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

p response 
result_array = []

response.businesses.each do |bar|
	result_array << [bar.name, bar.rating, bar.location.display_address]
end

# [["Lock Yard", 4.5, ["9221 5th Ave", "Bay Ridge", "Brooklyn, NY 11209"]], 
# ["Caledonia Scottish Pub", 4.5, ["1609 2nd Ave", "Upper East Side", "New York, NY 10028"]], 
# ["The Monro Pub", 4.5, ["481 5th Ave", "South Slope", "Brooklyn, NY 11215"]], 
# ["Fig 19", 4.0, ["131 1/2 Chrystie St", "Lower East Side", "New York, NY 10002"]], 
# ["duckduck", 4.0, ["161 Montrose Ave", "East Williamsburg", "Brooklyn, NY 11206"]]]



class Bar

	def initialize(name, rating, address)
		@name = name
		@rating = rating
		@address = address
	end

end



