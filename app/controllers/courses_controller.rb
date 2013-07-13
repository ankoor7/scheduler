class CoursesController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def update
  end

  def create
  end

  def destroy
  end

  def add_event(event, course)
    raise ArgumentError if event.class != Event
    course.events << event
  end

end
