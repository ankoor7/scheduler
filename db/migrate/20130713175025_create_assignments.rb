class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.datetime :due_date
      t.string :name
      t.text :desription

      t.timestamps
    end
  end
end
