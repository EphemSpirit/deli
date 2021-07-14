Product.destroy_all

10.times do
  vegetarian = Product.create!(name: Faker::Food.dish,
                               description: Faker::Food.description,
                               price: Faker::Commerce.price(range: 0.0..35.0),
                               vegetarian: true)

  vegan = Product.create!(name: Faker::Food.dish,
                  description: Faker::Food.description,
                  price: Faker::Commerce.price(range: 0.0..35.0),
                  vegan: true)

  dairy_free = Product.create!(name: Faker::Food.dish,
                  description: Faker::Food.description,
                  price: Faker::Commerce.price(range: 0.0..35.0),
                  dairy_free: true)

  nut_free = Product.create!(name: Faker::Food.dish,
                  description: Faker::Food.description,
                  price: Faker::Commerce.price(range: 0.0..35.0),
                  nut_free: true)

  vegetarian.image.attach(io: open('app/assets/images/salad.jpg'), filename: '#{i}_vege_image.jpg')
  vegan.image.attach(io: open('app/assets/images/pasta.jpg'), filename: '#{i}_vegan_img.jpg')
  dairy_free.image.attach(io: open('app/assets/images/bread.jpg'), filename: '#{i}_dairy_img.jpg')
  nut_free.image.attach(io: open('app/assets/images/canoli.jpg'), filename: '{i}_nut_img.jpg')

  vegetarian.save
  vegan.save
  dairy_free.save
  nut_free.save
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?