# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Insert Data ...................."
url = "https://api.coingecko.com/api/v3/coins/list"

response = RestClient.get(url)
result = JSON.parse(response)
result.each do |data|
    Coin.create(coin_id:data['id'],name:data['name'],symbool:data['symbol'])
end
puts "Data successfully insert"
