class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :ssn, null: false
      t.text :maintenance
      t.binary :contract, :limit => (16*1024*1024 - 1)

      t.timestamps null: false
    end
  end
end
