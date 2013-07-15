class RemoveEventIdFromMaterial < ActiveRecord::Migration
  def up
    remove_column :materials, :event_id
  end

  def down
    add_column :materials, :event_id, :string
  end
end
