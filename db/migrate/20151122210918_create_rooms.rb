class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :apartment_id, null: false
      t.float :rent, null: false
      t.binary :layout, :limit => (16*1024*1024 - 1)
      t.string :request

      t.timestamps null: false
    end
  end
end
