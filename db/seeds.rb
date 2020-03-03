# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all

Item.create(name: "Black Leather Sofa", price: "300.00", description: "Made in Japan, Black Leather Sofa")

5.times do
    Item.create([{
        name: "Black #{Faker::House.furniture}", 
        price: Faker::Number.within(range: 400...600), 
        description: Faker::Lorem.sentence(word_count: 5) 
    }])
end