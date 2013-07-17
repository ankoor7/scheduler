class OutlinesController < ApplicationController
  def agenda

  @events_as_student = current_user.events

  @events_as_teacher = Event.where(teacher: current_user.id)

  @pending_assignments = []

  end

  def dashboard
    @events = Event.order("scheduled_date ASC")
  end

  def room_allocations
  end

end
