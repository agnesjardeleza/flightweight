# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'admin', password: '1234', role: 'admin')
person = Person.create(user_id: 1, first_name: 'super', last_name: 'system', mid_name: 'administrator', address: 'UP Diliman', contact_num: '09000000000', email: 'admin@gmail.com')

user = User.create(username: 'cdbillones', password: '1234', role: 'regular')
person = Person.create(user_id: 2,first_name: 'Cjay', last_name: 'Billones', mid_name: 'dela Cruz', address: 'UP Diliman', contact_num: '09999999999', email:'billonesciprian08@gmail.com')

user = User.create(username: 'gmpalaganas', password: '1234', role: 'regular')
person = Person.create(user_id: 3,first_name: 'Genesis', last_name: 'Palaganas', mid_name: 'Martinez', address: 'UP Diliman', contact_num: '09888888888', email:'gen_mart95@yahoo.com')

user = User.create(username: 'ddhostallero', password: '1234', role: 'regular')
person = Person.create(user_id: 4,first_name: 'David', last_name: 'Hostallero', mid_name: 'D', address: 'UP Diliman', contact_num: '09777777777', email:'ddhostallero@gmail.com')

i = 0

while i < 10
	post = Post.create(poster_id: 2, weight: i+1, date_of_flight: '2015-04-30', details: 'detail' + i.to_s, flight_number: 12+i , category: 'request', origin: 'manila', destination: 'cebu', is_active: true)
	post = Post.create(poster_id: 3, weight: i+1, date_of_flight: '2015-04-30', details: 'detail' + i.to_s, flight_number: 123+i+1, category: 'advertisement', origin: 'cebu', destination: 'manila', is_active: true)
	i = i+1
end