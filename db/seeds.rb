# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: 'Luke burger', description: 'food', price: 7)
Product.create(name: 'Yoda burger', description: 'veggie', price: 3)
Product.create(name: 'Leia burger', description: 'burger', price: 10)