# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Danny", last_name: "Ronda", email: "danny_ronda@example.com", password: "danny_ronda")
User.create(first_name: "Rwanda", last_name: "Smith", email: "smithy@example.com", password: "smithy")
User.create(first_name: "Tessa", last_name: "Virtue", email: "tvirtue@figureskating.ca", password: "scottmoir")
User.create(first_name: "Patricia", last_name: "Roberts", email: "patbob@gmail.com", password: "patty")
User.create(first_name: "Eric", last_name: "Watson", email: "watson@example.com", password: "ewatson")
User.create(email: "hidden@example.com", password: "hidden")




