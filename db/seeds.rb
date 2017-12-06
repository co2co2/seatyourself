# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all

User.create(email: 'teng.ty@gmail.com', password: '1234')
User.create(email: "coolguy@sunglasses.com", password: "1234")
User.create(email: "lordofdarkness@dungeon.co", password: "1234")
User.create(email: "flyingthroughtheclouds@bluebird.com", password: "1234")
User.create(email: "ourfinesthour@timer.co", password: "1234")
User.create(email: "itsmunchintime@eatme.com", password: "1234")


Restaurant.create(name: "Polar Bear Creamery", address: "123 Cold Rd", capacity: 50, open_hour: Time.parse("11:30"), close_hour: Time.parse("18:30"))
Restaurant.create(name: "Endless Cavern", address: "1 Moria Mn", capacity: 10000, open_hour: Time.parse("11:30"), close_hour: Time.parse("22:30"))
Restaurant.create(name: "McDouble", address: "200 Glass Ave", capacity: 100, open_hour: Time.parse("11:30"), close_hour: Time.parse("22:30"))
Restaurant.create(name: "The Fancy Top Hat", address: "77 Caviar Pl", capacity: 20, open_hour: Time.parse("11:30"), close_hour: Time.parse("22:30"))
Restaurant.create(name: "Grill House", address: "8 Meat Heaven Lane", capacity: 100, open_hour: Time.parse("11:30"), close_hour: Time.parse("22:30"))


Reservation.create(user_id: 13, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,10), time_slot: Time.now - 2.hours)
Reservation.create(user_id: 13, restaurant_id: 2, party_size: 5, date: Date.new(2017,12,20), time_slot: Time.now - 1.hours)
Reservation.create(user_id: 13, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,25), time_slot: Time.now - 5.hours)
Reservation.create(user_id: 14, restaurant_id: 1, party_size: 6, date: Date.new(2017,12,10), time_slot: Time.now - 10.hours)
Reservation.create(user_id: 14, restaurant_id: 3, party_size: 12, date: Date.new(2020,10,22), time_slot: Time.now - 6.hours)
Reservation.create(user_id: 14, restaurant_id: 5, party_size: 2, date: Date.new(2018,06,28), time_slot: Time.now - 4.hours)
Reservation.create(user_id: 15, restaurant_id: 1, party_size: 2, date: Date.new(2017,12,10), time_slot: Time.now - 3.hours)
Reservation.create(user_id: 15, restaurant_id: 4, party_size: 20, date: Date.new(2217,12,10), time_slot: Time.now - 2.hours)
Reservation.create(user_id: 16, restaurant_id: 3, party_size: 8, date: Date.new(2018,01,18), time_slot: Time.now - 1.hours)
Reservation.create(user_id: 17, restaurant_id: 2, party_size: 1000, date: Date.new(2017,12,31), time_slot: Time.now - 1.hours)
