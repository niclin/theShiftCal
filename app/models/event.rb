class Event < ApplicationRecord

  def to_ics
        event = Icalendar::Event.new
        event.dtstart = self.start_time.strftime("%Y%m%dT%H%M%S")
        event.dtend = self.end_time.strftime("%Y%m%dT%H%M%S")
        event.summary = self.summary
        event.created = self.created_at
        event.last_modified = self.updated_at
        #event.url = "#{PUBLIC_URL}events/#{self.id}"
        event
      end


  def slack_list
    self.slack_list[] = self.slack.split(/\s*,\s*/)
  end


end
