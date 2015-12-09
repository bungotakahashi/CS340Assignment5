class AddRoomIdToLive < ActiveRecord::Migration
  def change
    add_column :lives, :room_id, :int
  end
end
