class AddEventIdToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :event_id, :integer
  end
end
