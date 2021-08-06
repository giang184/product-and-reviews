# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

34.times do |index|
  product = Product.create!(name: Faker::Beer.unique.name, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Nation.nationality)
  5.times do |index|
    Review.create!(author: Faker::Name.unique.name, product_id: product.id, content_body: Faker::Quote.famous_last_words, rating: Faker::Number.within(range: 1..5))
  end
end

1.times do |index|
  product = Product.create!(name: "Apex Legends", cost: Faker::Number.decimal(l_digits: 2), country_of_origin: "American")
  7.times do |index|
    Review.create!(author: Faker::Name.unique.name, product_id: product.id, content_body: Faker::Quote.famous_last_words, rating: Faker::Number.within(range: 1..5))
  end
end

15.times do |index|
  product = Product.create!(name: Faker::Beer.unique.name, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: "American")
  5.times do |index|
    Review.create!(author: Faker::Name.unique.name, product_id: product.id, content_body: Faker::Quote.famous_last_words, rating: Faker::Number.within(range: 1..5))
  end
end

p "Created #{Product.count} products"