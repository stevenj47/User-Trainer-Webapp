# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds a database with 4 existing users

User.create(name: "Aaron", email: "aaron@mail.com", password: "aaron123",
			password_confirmation: "aaron123", client: 1)

User.create(name: "Billy", email: "billy@mail.com", password: "billy123",
			password_confirmation: "billy123", client: 2)

User.create(name: "Eve", email: "eve@mail.com", password: "eve123",
			password_confirmation: "eve123", client: 2)

User.create(name: "James", email: "james@mail.com", password: "james123",
			password_confirmation: "james123", client: 1)
