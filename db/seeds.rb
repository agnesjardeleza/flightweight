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
	post = Post.create(poster_id: 2, weight: i+1, date_of_flight: '2015-04-30 08:00:00', 
		details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel pulvinar sapien. Aliquam eu sagittis eros. Mauris venenatis volutpat enim, quis porta nibh condimentum at. Duis suscipit suscipit enim. Nullam tempus bibendum quam. Mauris nisi velit, ultrices eget egestas id, ultrices vitae lacus. Suspendisse et pharetra nunc, sit amet imperdiet mi. Vestibulum aliquet imperdiet ipsum vel tempor. Ut tempor non quam ut pharetra. Suspendisse potenti. Integer a lorem mattis, tempus velit vel, placerat diam. Praesent tortor orci, pulvinar at hendrerit ac, pulvinar in neque. Aenean quis consequat libero. Curabitur tincidunt augue at tellus tristique, nec lobortis enim interdum. Etiam molestie velit at convallis aliquam.' , flight_number: 12+i , category: 'request', origin: 'manila', destination: 'cebu', is_active: true)
	post = Post.create(poster_id: 3, weight: i+1, date_of_flight: '2015-04-30 12:00:00', details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel pulvinar sapien. Aliquam eu sagittis eros. Mauris venenatis volutpat enim, quis porta nibh condimentum at. Duis suscipit suscipit enim. Nullam tempus bibendum quam. Mauris nisi velit, ultrices eget egestas id, ultrices vitae lacus. Suspendisse et pharetra nunc, sit amet imperdiet mi. Vestibulum aliquet imperdiet ipsum vel tempor. Ut tempor non quam ut pharetra. Suspendisse potenti. Integer a lorem mattis, tempus velit vel, placerat diam. Praesent tortor orci, pulvinar at hendrerit ac, pulvinar in neque. Aenean quis consequat libero. Curabitur tincidunt augue at tellus tristique, nec lobortis enim interdum. Etiam molestie velit at convallis aliquam.', flight_number: 123+i+1, category: 'advertisement', origin: 'cebu', destination: 'manila', is_active: true)
	i = i+1
end