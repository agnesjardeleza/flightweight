class Bid < ActiveRecord::Base

	validates_presence_of :weight
	validates_presence_of :details
	validates_presence_of :flight_number

end
