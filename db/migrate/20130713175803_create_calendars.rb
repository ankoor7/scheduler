class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :date
      t.integer :time_slot

      t.timestamps
    end
  end
end
