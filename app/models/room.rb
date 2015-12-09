class Room < ActiveRecord::Base
	has_one :live
	has_many :residents, through: :lives
    belongs_to :apartment_datum
	belongs_to :other_property
	validates :layout, presence: true#, :message => "Layout cannot be blank" 
end
