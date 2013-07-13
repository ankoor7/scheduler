class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :address
      t.integer :size

      t.timestamps
    end
  end
end
