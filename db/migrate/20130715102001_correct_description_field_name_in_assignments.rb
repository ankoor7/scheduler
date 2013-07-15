class CorrectDescriptionFieldNameInAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :description, :text
    remove_column :assignments, :desription
  end

  def down
    remove_column :assignments, :description
    add_column :assignments, :desription, :text
  end
end
