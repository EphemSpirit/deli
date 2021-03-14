50.times do
  Product.create!(name: Faker::Food.dish,
                  description: Faker::Food.description,
                  price: Faker::Commerce.price(range: 10..35.0, as_string: true))
end
