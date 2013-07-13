class Course < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :events

  def add_event(event)
    raise ArgumentError if event.class != Event
    @course.events << event
  end

end
