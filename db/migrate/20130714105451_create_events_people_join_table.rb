class CreateEventsPeopleJoinTable < ActiveRecord::Migration
  def change
    create_table :events_people, :id => false do |t|
        t.integer :person_id
        t.integer :event_id
    end
  end
end
