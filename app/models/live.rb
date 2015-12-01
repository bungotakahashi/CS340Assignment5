class Live < ActiveRecord::Base
	self.primary_keys = :id, :ssn
	belongs_to :room
	belongs_to :resident
end
