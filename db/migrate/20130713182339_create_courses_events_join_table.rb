class CreateCoursesEventsJoinTable < ActiveRecord::Migration
  def change
    create_table :courses_events, :id => false do |t|
        t.integer :course_id
        t.integer :event_id
    end
  end
end
