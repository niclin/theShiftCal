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




  has_many :shifts
  has_many :slacks, through: :shifts

  def all_slacks=(names)
    self.slacks = names.split(",").map do |name|
      Slack.where(name: name.strip).first_or_create!
    end

  end

  def all_slacks
    self.slacks.map(&:name).join(", ")

  end

  def booked_with(name)
    Slack.find_by_name!(name).events

  end

end
