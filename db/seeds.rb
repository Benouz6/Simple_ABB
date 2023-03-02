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
photo5 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1670256240/naomi-hebert-MP0bgaS_d1c-unsplash_w05nhj.jpg")
photo6 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651074706/photo-1617817643768-8855fc457e3a_qxijtf.jpg")
photo7 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651074643/photo-1565623833408-d77e39b88af6_lbbb3t.jpg")
photo8 = URI.open("https://res.cloudinary.com/dmnmqtpct/image/upload/v1651015107/photo-1592839656073-833413ae8874_xamnu9.jpg")

puts "Creating flats..."

flat1 = Flat.create(name: 'Appart in Montreal', description: 'Amazing flat near le wagon. The place to be', address: "5333 Av. Casgrain, Montreal, QC", price: 100)
flat1.photos.attach(io: photo1, filename: 'house', content_type: "image/png")
flat2 = Flat.create(name: 'Appart on Saint Denis', description: 'Flat in the middle of the city! Well place, commidities, stores, bars and restaurants', address: '5333 Saint-Denis, Montreal, QC', price: 110)
flat2.photos.attach(io: photo2, filename: 'house2', content_type: "image/png")
flat3 = Flat.create(name: 'Flat in hochelag', description: 'Cosy place in Hochelaga. Behind a park', address: '3550 saint-Germain, Montreal, QC', price: 90)
flat3.photos.attach(io: photo3, filename: 'house3', content_type: "image/png")
flat4 = Flat.create(name: 'Flat in the mile end', description: 'Blue appartment, in the mile end. Near bars, restaurant and close to the laurier metro', address: '5233 clark, Montreal, QC', price: 1100)
flat4.photos.attach(io: photo4, filename: 'house4', content_type: "image/png")

flat5 = Flat.create(name: 'Appart in Paris', description: 'Flat near the republic place, with theatre, restaurant and bars', address: '4 boulevard Voltaire, Paris', price: 200)
flat5.photos.attach(io: photo5, filename: 'house5', content_type: "image/png")

flat6 = Flat.create(name: 'Appart Paris', description: 'Flat near the Nation place, with theatre, restaurant and bars', address: '71 boulevard de picpus, Paris', price: 1900)
flat6.photos.attach(io: photo6, filename: 'house6', content_type: "image/png")

# flat4 = Flat.create(name: 'Appart in New York', description: 'Blue appartment, in the mile end. Near bars, restaurant and close to the laurier metro', address: '5233 clark, Montreal, QC', price: 1100)
# flat4.photos.attach(io: photo4, filename: 'house4', content_type: "image/png")
# flat4 = Flat.create(name: 'Appart in New York', description: 'Blue appartment, in the mile end. Near bars, restaurant and close to the laurier metro', address: '5233 clark, Montreal, QC', price: 1100)
# flat4.photos.attach(io: photo4, filename: 'house4', content_type: "image/png")

puts 'Created flats'
puts 'create user'
user1 = User.create(username: "ben", email: "b@b.b", password: '123456')
user2 = User.create(username: "cris", email: "c@c.c", password: '123456')
user3 = User.create(username: "Ines", email: "i@i.i", password: '123456')

user1.save
user2.save
user3.save
puts 'users Created'


flat1.user_id = user1.id
flat1.save!

flat2.user_id = user1.id
flat2.save!

flat3.user_id = user2.id
flat3.save!

flat4.user_id = user2.id
flat4.save!

flat5.user_id = user3.id
flat5.save!

flat6.user_id = user3.id
flat6.save!2

puts "Finished!"
