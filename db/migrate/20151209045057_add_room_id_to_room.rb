class AddRoomIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :room_id, :int
  end
end
