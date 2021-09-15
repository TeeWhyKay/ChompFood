require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "clearing db"
Restaurant.destroy_all

puts "seeding db with restaurants"



20.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address:
    opening_time: ["7:00AM", "8:00AM", "9:00AM", "10:00AM", "11:00AM"].sample,
    closing_time: ["6:00PM", "7:00PM", "8:00PM", "9:00PM", "10:00PM", "11:00PM"].sample
  )
end
puts "seeding restaurant completed"
