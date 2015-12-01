class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :ssn, null: false
      t.binary :document, :limit => (16*1024*1024 - 1)
      t.timestamps null: false

    end
  end
end
