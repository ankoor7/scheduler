class OutlinesController < ApplicationController
  def agenda
    @events_as_student = current_user.events

    @events_as_teacher = Event.where(teacher: current_user.id)
    @timeslots = TimeSlot.all

    @pending_assignments = []

  end

  def dashboard
    @events = Event.order("scheduled_date ASC")
    @users = Person.order(:name)
    @timeslots = TimeSlot.all
  end

  def room_allocations
  end

end
