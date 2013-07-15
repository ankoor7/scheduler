class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.references :company

      t.timestamps
    end
    add_index :locations, :company_id
  end
end
