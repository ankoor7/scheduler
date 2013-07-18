class EventsController < ApplicationController

load_and_authorize_resource

  def index
    # @events = Event.all
   now = Date.today
    @timeslots = TimeSlot.all
    @date_range=Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    @events=Event.includes.where(scheduled_date: @date_range)
    @rooms=Room.all
  end

  def show
    @event = Event.find(params[:id])

  end

  def register_user
    @event = Event.find(params[:id])
    if current_user
      @event.add_student current_user
      redirect_to (stored_location || root_path )
    else
      param[:redirect] = event.id
      redirect_to login_path
    end
  end

  def deregister_user
    @event = Event.find(params[:id])
    @event.remove_student current_user
      redirect_to root
  end


  def new
    @event = Event.new
    now = Date.today
    @timeslots = TimeSlot.all
    @date_range=Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    @events=Event.includes.where(scheduled_date: @date_range)
    @rooms=Room.all
  end

  def create
    @event = Event.new(params[:event])
    @event.scheduled_date=Date.new(params[:scheduled_date][:year].to_i,params[:scheduled_date][:month].to_i,params[:scheduled_date][:day].to_i)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
    now = Date.today
    @timeslots = TimeSlot.all
    @date_range=Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    @events=Event.thisweek
    @rooms=Room.all
  end

  def update
    @event = Course.find(params[:event])
    @event.scheduled_date=Date.new(params[:scheduled_date][:year].to_i,params[:scheduled_date][:month].to_i,params[:scheduled_date][:day].to_i)
    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: "edit", notice: 'Event was not updated.'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
end
