# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(10, 20), admin: Faker::Boolean.boolean)


    cart = Cart.new
    cart.user = user
    cart.save

    order = Order.new
    order.user = user
    order.save

    line_product = LineProduct.create(quantity: Faker::Number.number(3))
    line_product.cart = cart
    line_product.save


    recipient = Recipient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, message: Faker::Friends.quote, mobile_number: Faker::PhoneNumber.cell_phone)


    address = Address.create(street_1: Faker::Address.street_address, street_2: Faker::Address.secondary_address, city: Faker::Address.city, zip: Faker::Address.zip)
    address.recipient = recipient
    address.user = user
    address.save



end

5.times do

product = Product.create(name: Faker::Ancient.god, description: Faker::Lorem.sentence(10), date_delivered: Faker::Date.backward(70))

line_product = LineProduct.create(quantity: Faker::Number.number(3))
line_product.product = product
line_product.save

end
