# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the db...'

Restaurant.destroy_all

puts 'db is clean'
puts 'creating restaurants...'

5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: %w[chinese italian japanese french belgian].sample
  )
  rand(1..5).times do
    review = Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
    puts "#{restaurant.id}-#{restaurant.name}'s review was created"
  end
  puts "#{restaurant.id}-#{restaurant.name} was created"
end
