class Resident < ActiveRecord::Base
	attr_accessor :room_id
	has_one :live, :foreign_key => :ssn, :dependent => :delete
	has_many :rooms, through: :lives
	has_many :parking_lots,  :foreign_key => :ssn, :dependent => :nullify
	belongs_to :apartment_datum
	belongs_to :other_property
	validates :ssn, presence: true, uniqueness: {message: "duplicae ssn" }
	validates :document, presence: true
end
