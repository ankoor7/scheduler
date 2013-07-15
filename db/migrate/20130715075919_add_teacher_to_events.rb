class AddTeacherToEvents < ActiveRecord::Migration
  def change
    add_column :events, :teacher, :integer
  end
end
