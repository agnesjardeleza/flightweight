class Person < ActiveRecord::Base

	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :mid_name
	validates_presence_of :address
	validates_presence_of :contact_num
	validates_presence_of :email


	def fullname
		first_name + " " + mid_name + " " + last_name 
	end

end
