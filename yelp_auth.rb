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

class Bar
	def initialize(name, rating, address)
		@name = name
		@rating = rating
		@address = address
	end
end



