# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

6.times do
  Category.create name: Faker::Hacker.noun
end
puts 'created 6 categories'

20.times do
  User.create first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: 'secret'
end
puts 'created 20 users'

1000.times do
  category = Category.all.sample
  user = User.all.sample

  Product.create title: Faker::Hacker.say_something_smart,
                  description: Faker::Hacker.say_something_smart,
                  price: rand(1000),
                  category_id: category.id,
                  user_id: user.id

end
puts 'Created 1000 products'
