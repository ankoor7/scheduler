class FixDateColumnNameInEvents < ActiveRecord::Migration
  def up
    rename_column :events, :date, :scheduled_date
  end

  def down
    rename_column :events, :scheduled_date, :date
  end
end
