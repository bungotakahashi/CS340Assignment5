class AddApartmentIdToResident < ActiveRecord::Migration
  def change
    add_column :residents, :apartment_id, :int
  end
end
