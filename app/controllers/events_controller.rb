class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]


  def index

    if params[:slack]
      @events = Event.booked_with(params[:slack])
    else
      @events = Event.all
    end

    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        @events.each do |event|
          cal.add_event(event.to_ics)
          cal.publish
        end
        render :text => cal.to_ical
      end
    end

  end

  def ics_export

    @events = Event.all
    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        @events.each do |event|
          cal.add_event(event.to_ics)
          cal.publish
        end
        render :text => cal.to_ical
      end
    end
  end


  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        cal.add_event(@event.to_ics)
        cal.publish
        render :text => cal.to_ical
      end
    end
  end


  def new
    @event = Event.new

  end

  def create
    @event = Event.new(event_parmas)
    if @event.save!
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
    if @event.update(event_parmas)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end



 private

 def event_parmas
   params.require(:event).permit(:start_time,:end_time,:summary, :content, :all_slacks,:week_table_id)

 end


end
