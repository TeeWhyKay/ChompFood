require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "clearing db"
Food.destroy_all
Restaurant.destroy_all

puts "seeding db with restaurants"

url = "https://tih-api.stb.gov.sg/content/v1/search/all?dataset=food_beverages&language=en&apikey=ytxKCmRhV2kPY8fEpKXN63SuuQSkVmPw"
address_serialized = URI.open(url).read
address_parsed = JSON.parse(address_serialized)


20.times do |index|
  address_street = address_parsed["data"]["results"][index]["address"]
  full_address = "#{address_street["block"]} #{address_street["streetName"]}, Singapore"

  Restaurant.create(
    name: address_parsed["data"]["results"][index]["name"],
    address: full_address,
    longitude: address_parsed["data"]["results"][index]["location"]["longitude"],
    latitude: address_parsed["data"]["results"][index]["location"]["latitude"],
    opening_time: address_parsed["data"]["results"][index]["businessHour"].first["openTime"],
    closing_time: address_parsed["data"]["results"][index]["businessHour"].first["closeTime"],
    promo_status: rand(0..1)
  )
  puts "seeded #{address_parsed["data"]["results"][index]["name"]}"
end
puts "seeding restaurant completed"


puts 'Creating 10 fake fooditems...'
10.times do
  fooditem = Food.new(
    name:       Faker::Food.dish,
    description:    Faker::Food.description,
    price: rand(0...10.0).round(2),
    photo_url: "https://source.unsplash.com/random/300x200?food&sig=#{rand(1..100)}"
  )
  fooditem.restaurant = Restaurant.first
  fooditem.save!
end
puts 'Food items created!'

last_restaurant = Restaurant.last
last_restaurant.promo_status = 1
last_restaurant.save!

puts 'Creating 7 fake fooditems for the last restaurant...'
7.times do
  fooditem = Food.new(
    name:       Faker::Food.dish,
    description:    Faker::Food.description,
    price: rand(0...10.0).round(2),
    photo_url: "https://source.unsplash.com/random/300x200?food&sig=#{rand(1..100)}"
  )
  fooditem.restaurant = Restaurant.last
  fooditem.save!
end
puts 'Food items created for last restaurant!'


