class CreateParkingLots < ActiveRecord::Migration
  def change
    create_table :parking_lots do |t|
      t.string :ssn
      t.integer :apartment_id

      t.timestamps null: false
    end
  end
end
