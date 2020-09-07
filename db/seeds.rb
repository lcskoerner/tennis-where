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
require 'json'

puts "Cleaning Database"
Booking.destroy_all if Rails.env.development?
TennisCourt.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
puts "Cleaning Done"

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

puts "Creating player"
player = User.create(
  email: "player@tenniscourt.com",
  password: 123456,
  first_name: "Gustavo",
  last_name: "Kuster",
  owner: false,
  phone_number: 5146997352
)

player.save!
puts 'User player@tenniscourt.com/123456 created!'

puts "Creating Lucas"
player = User.create(
  email: "lucas@tenniscourt.com",
  password: 123456,
  first_name: "Lucas",
  last_name: "Nadal",
  owner: false,
  phone_number: 5143454556
)

player.save!
puts 'User lucas@tenniscourt.com/123456 created!'

puts "Creating Mohamed"
player = User.create(
  email: "mohamed@tenniscourt.com",
  password: 123456,
  first_name: "Mohamed",
  last_name: "Murray",
  owner: false,
  phone_number: 5142948775
)

player.save!
puts 'User mohamed@tenniscourt.com/123456 created!'

puts "Creating Romain"
player = User.create(
  email: "romain@tenniscourt.com",
  password: 123456,
  first_name: "Romain",
  last_name: "Djoko",
  owner: false,
  phone_number: 5142943459
)

player.save!
puts 'User romain@tenniscourt.com/123456 created!'

puts "Creating Tanguy"
player = User.create(
  email: "tanguy@tenniscourt.com",
  password: 123456,
  first_name: "Tanguy",
  last_name: "Federer",
  owner: false,
  phone_number: 5149583755
)

player.save!
puts 'User tanguy@tenniscourt.com/123456 created!'



puts 'creating tennis courts...'

filepath = 'db/tennis_courts.json'
serialized_tennis_courts = File.read(filepath)
tennis_courts = JSON.parse(serialized_tennis_courts)

tennis_courts.each_with_index do |t,i|
  tennis_court = TennisCourt.new(
    name: t["title"],
    address: t["address"],
    price_per_hour: rand(10..20),
    detail: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: owner.id
  )
  file = URI.open('https://source.unsplash.com/collection/12216661/1600x900')
  tennis_court.photo.attach(io: file, filename: SecureRandom.hex, content_type: 'image/jpeg')
  tennis_court.save!
  sleep(10)
  puts "tennis court #{i + 1} created!"
end

puts 'seed finished!'
