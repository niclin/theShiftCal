class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]


  def index

    if params[:slack]
      @events = Event.booked_with(params[:slack])

  else
    @events = Event.all
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
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
    def destroy_all
      Event.delete_all

    end


 private

 def event_parmas
   params.require(:event).permit(:start_time,:end_time,:summary, :content, :all_slacks,:week_table_id)

 end


end
