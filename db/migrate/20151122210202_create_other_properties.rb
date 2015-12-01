class CreateOtherProperties < ActiveRecord::Migration
  def change
    create_table :other_properties do |t|
      t.string :address, null: false
      t.date :date_built
      t.text :comments
      t.float :cost
      t.integer :owner_id, null: false

      t.timestamps null: false
    end
  end
end
