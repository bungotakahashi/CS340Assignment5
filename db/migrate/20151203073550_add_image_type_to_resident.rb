class AddImageTypeToResident < ActiveRecord::Migration
  def change
    add_column :residents, :image_type, :string
  end
end
