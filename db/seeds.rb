# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


User.create(name: "Augusto", username: "Otsugua", email: "augusto@email.com", description: "Cheap date", password: "hello")

User.create( name: "Anastasia", username: "KittyGirl", email: "anastasia@hotmail.com", description: "Street cat running from heartache", password: "hello")

