class Room < ActiveRecord::Base
	has_many :lives
	has_many :residents, through: :lives
    belongs_to :apartment_datum
	belongs_to :other_property
end
