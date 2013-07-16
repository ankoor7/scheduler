class OutlinesController < ApplicationController
  def agenda

  @events_as_student = current_user.events

  @events_as_teacher = Event.where(teacher: current_user.id)

  end

  def dashboard
    @events = Event.all
  end
end
