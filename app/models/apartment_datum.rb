class ApartmentDatum < ActiveRecord::Base
	belongs_to :user 
	has_many :rooms
	has_many :residents
	has_many :parking_lots
	validates :name, presence: true#, :message => "Name cannot be blank" 
	validates :address, presence: true#, :message => "Address cannot be blank"
end
