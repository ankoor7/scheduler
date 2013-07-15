module CoursesHelper

  def add_event(event, course)
    raise ArgumentError if event.class != Event
    course.events << event
  end

end
