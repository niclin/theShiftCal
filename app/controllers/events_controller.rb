class EventsController < ApplicationController

  def to_ics
    event = Icalendar::Event.new
    event.start = self.date.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_date.strftime("%Y%m%dT%H%M%S")
    event.summary = self.title
    event.description = self.summary
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
    event.add_comment("AF83 - Shake your digital, we do WowWare")
    event
  end


  def show
    @event = Event.find(params[:id])
    respond_to do |wants|
    wants.html
    wants.ics do
     calendar = Icalendar::Calendar.new
     calendar.add_event(@event.to_ics)
     calendar.publish
     render :text => calendar.to_ical
       end
     end
    end



  def new
    @event = Event.new

  end

  def create
    @event = Event.new(event_parmas)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end


  def updated
    @event = Event.find(params[:id])
    if @event.save
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


 private

 def event_parmas
   params.require(:event).permit(:start_time,:end_time,:summary, :content)

 end


end
