# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'teng.ty@gmail.com', password: '1234')
User.create(email: "coolguy@sunglasses.com", password: "1234")
User.create(email: "lordofdarkness@dungeon.co", password: "1234")
User.create(email: "flyingthroughtheclouds@bluebird.com", password: "1234")
User.create(email: "ourfinesthour@timer.co", password: "1234")
User.create(email: "itsmunchintime@eatme.com", password: "1234")


Restaurant.create(name: "Polar Bear Creamery", address: "123 Cold Rd", capacity: 50)
Restaurant.create(name: "Endless Cavern", address: "1 Moria Mn", capacity: 10000)
Restaurant.create(name: "McDouble", address: "200 Glass Ave", capacity: 100)
Restaurant.create(name: "The Fancy Top Hat", address: "77 Caviar Pl", capacity: 20)
Restaurant.create(name: "Grill House", address: "8 Meat Heaven Lane", capacity: 100)


Reservation.create(user_id: 1, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,10))
Reservation.create(user_id: 1, restaurant_id: 2, party_size: 5, date: Date.new(2017,12,20))
Reservation.create(user_id: 1, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,25))
Reservation.create(user_id: 2, restaurant_id: 1, party_size: 6, date: Date.new(2017,12,10))
Reservation.create(user_id: 2, restaurant_id: 3, party_size: 12, date: Date.new(2020,10,22))
Reservation.create(user_id: 2, restaurant_id: 5, party_size: 2, date: Date.new(2018,06,28))
Reservation.create(user_id: 3, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,10))
Reservation.create(user_id: 3, restaurant_id: 4, party_size: 20, date: Date.new(2217,12,10))
Reservation.create(user_id: 4, restaurant_id: 3, party_size: 8, date: Date.new(2018,01,18))
Reservation.create(user_id: 5, restaurant_id: 2, party_size: 1000, date: Date.new(2017,12,31))
