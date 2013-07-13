class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :file
      t.string :event_id

      t.timestamps
    end
  end
end
