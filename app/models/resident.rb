class Resident < ActiveRecord::Base
	has_many :lives
	has_many :rooms, through: :lives
	has_many :parking_lots
	belongs_to :apartment_datum
	belongs_to :other_property
end
