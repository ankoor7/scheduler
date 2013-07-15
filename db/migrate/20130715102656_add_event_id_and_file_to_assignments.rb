class AddEventIdAndFileToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :event_id, :integer
    add_column :assignments, :file, :string
  end
end
