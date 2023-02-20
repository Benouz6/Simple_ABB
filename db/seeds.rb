require 'faker'

puts "Cleaning database..."
Flat.destroy_all
User.destroy_all

puts "Creating flats..."

flat1 = Flat.create(name: 'Appart in Paris', description: 'Amazing', address: 'Paris 11', price: 100)
flat2 = Flat.create(name: 'Appart in London', description: 'Amazing', address: 'London 11', price: 100)
flat3 = Flat.create(name: 'Appart in Montreal', description: 'Amazing', address: 'Montreal 11', price: 100)
flat4 = Flat.create(name: 'Appart in New York', description: 'Amazing', address: 'New York 11', price: 100)

puts 'Created flats'
puts 'create user'
user1 = User.create(username: "ben", email: "b@b.b", password: '123456')
user2 = User.create(username: "cris", email: "c@c.c", password: '123456')

user1.save
user2.save


flat1.user_id = user1.id
flat1.save!

flat2.user_id = user1.id
flat2.save!

flat3.user_id = user2.id
flat3.save!

flat4.user_id = user2.id
flat4.save!

puts "Finished!"
