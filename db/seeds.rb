# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data to prevent duplication
Restaurant.destroy_all

# Categories array for restaurants
categories = ["chinese", "italian", "japanese", "french", "belgian"]

# Generate 10 restaurants
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample # Randomly selects a category
  )

  # Generate between 1 to 5 reviews for each restaurant
  rand(1..5).times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5), # Random rating between 0 and 5
      restaurant: restaurant # Associate review with the created restaurant
    )
  end
end

puts "Created #{Restaurant.count} restaurants with reviews."
