require 'faker'

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."

flat1.create!(name: 'Appart in Paris', description: 'Amazing', address: 'Paris 11', price: 100)
flat1.create!(name: 'Appart in London', description: 'Amazing', address: 'London 11', price: 100)
flat1.create!(name: 'Appart in Montreal', description: 'Amazing', address: 'Montreal 11', price: 100)
flat1.create!(name: 'Appart in New York', description: 'Amazing', address: 'New York 11', price: 100)

puts "Finished!"
