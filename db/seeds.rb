require 'faker'

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."

flat1 = Flat.create(name: 'Appart in Paris', description: 'Amazing', address: 'Paris 11', price: 100)
flat2 = Flat.create(name: 'Appart in London', description: 'Amazing', address: 'London 11', price: 100)
flat3 = Flat.create(name: 'Appart in Montreal', description: 'Amazing', address: 'Montreal 11', price: 100)
flat4 = Flat.create(name: 'Appart in New York', description: 'Amazing', address: 'New York 11', price: 100)

user1 = User.create(username: "ben")

flat1.user_id =

puts "Finished!"
