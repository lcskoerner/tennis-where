# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require 'faker'
require 'open-uri'

puts "Creating owner"
owner = User.create(
  email: "owner@tenniscourt.com",
  password: 123456,
  first_name: "Andre",
  last_name: "Agassi",
  owner: true,
  phone_number: 5146997455
)

owner.save!
puts 'User owner@tenniscourt.com/123456 created!'

puts 'creating 10 fake tennis courts...'
10.times do |t|
  tennis_court = TennisCourt.new(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    price_per_hour: rand(10..20),
    detail: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: owner.id
  )
  file = URI.open('https://source.unsplash.com/collection/12216661/1600x900')
  tennis_court.photo.attach(io: file, filename: SecureRandom.hex, content_type: 'image/jpeg')
  tennis_court.save!
  sleep(10)
  puts "tennis court #{t + 1} created!"
end

puts 'seed finished!'
