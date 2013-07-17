class EventsController < ApplicationController
  def index
    # @events = Event.all
    now = Date.today
    thisweek = Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    thismonth = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+1.month)
    next3month = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+3.month)
    @timeslots = TimeSlot.all
    # date_range=params[:date_range]
    @date_range=thisweek
    @events=Event.includes.where(scheduled_date: @date_range)
    @rooms=Room.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    now = Date.today
    thisweek = Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    thismonth = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+1.month)
    next3month = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+3.month)
    @timeslots = TimeSlot.all
    # date_range=params[:date_range]
    @date_range=thisweek
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
    thisweek = Date.commercial(now.cwyear,now.cweek)..Date.commercial(now.cwyear,now.cweek+1)
    thismonth = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+1.month)
    next3month = Date.civil(now.year,now.month)..(Date.civil(now.year,now.month)+3.month)
    @timeslots = TimeSlot.all
    # date_range=params[:date_range]
    @date_range=thisweek
    @events=Event.includes.where(scheduled_date: @date_range)
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
