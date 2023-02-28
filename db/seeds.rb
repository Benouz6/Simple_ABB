require 'faker'
require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts 'Creating images...'
photo1 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1670256240/scott-webb-1ddol8rgUH8-unsplash_fce5vk.jpg")
photo2 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651110332/photo-1500076656116-558758c991c1_fdsrjm.jpg")
photo3 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651074609/photo-1592928302636-c83cf1e1c887_vcjogb.jpg")
photo4 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651074563/photo-1601628828688-632f38a5a7d0_b8m47y.jpg")

puts "Creating flats..."

flat1 = Flat.create(name: 'Appart in Paris', description: 'Amazing', address: "5333 Av. Casgrain, Montreal, QC", price: 100)
flat1.photos.attach(io: photo1, filename: 'house', content_type: "image/png")
flat2 = Flat.create(name: 'Appart in London', description: 'Amazing', address: '5333 Av. Saint-Denis, Montreal, QC', price: 110)
flat2.photos.attach(io: photo2, filename: 'house2', content_type: "image/png")
flat3 = Flat.create(name: 'Appart in Montreal', description: 'Amazing', address: '3550 saint-Germain, Montreal, QC', price: 90)
flat3.photos.attach(io: photo3, filename: 'house3', content_type: "image/png")
flat4 = Flat.create(name: 'Appart in New York', description: 'Amazing', address: '5333 Saint-Laurent, Montreal, QC', price: 1100)
flat4.photos.attach(io: photo4, filename: 'house4', content_type: "image/png")

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
