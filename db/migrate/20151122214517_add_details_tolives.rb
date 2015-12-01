class AddDetailsTolives < ActiveRecord::Migration
  def change
   	add_index :lives, [:id, :ssn], unique: true, name: 'composite_index'
  end
end
