class AddNameToApartmentData < ActiveRecord::Migration
  def change
    add_column :apartment_data, :name, :string
  end
end
