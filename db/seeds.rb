# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "vanita112003@gmail.com", password: 2801744, admin: true)
user = User.create(email: "navita_6@hotmail.com", password: 363363, admin: false)

3.times do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(10, 20), admin: false)


    cart = Cart.new
    cart.user = user
    cart.save


    line_product = LineProduct.create(quantity: 1)
    line_product.cart = cart
    line_product.save


    address = Address.create(street_1: Faker::Address.street_address, street_2: Faker::Address.secondary_address, city: Faker::Address.city, zip_code: Faker::Address.zip)
    address.user = user
    address.save

end

 10.times do
   product = Product.create(name: Faker::Ancient.god, description: Faker::Lorem.sentence(10), date_delivered: Faker::Date.backward(10))

   line_product = LineProduct.create(quantity: 1)
   line_product.product = product
   line_product.save

end
