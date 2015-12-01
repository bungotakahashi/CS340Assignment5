class ParkingLot < ActiveRecord::Base
	belongs_to :resident
    belongs_to :apartment_datum
	belongs_to :other_property
end
