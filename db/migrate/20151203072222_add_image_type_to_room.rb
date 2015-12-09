class AddImageTypeToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :image_type, :string
  end
end
