class OtherProperty < ActiveRecord::Base
	belongs_to :user 
	has_many :rooms
	has_many :residents
	has_many :parking_lots
end
