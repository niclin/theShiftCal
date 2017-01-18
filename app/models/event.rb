class Event < ApplicationRecord
  require 'icalendar/tzinfo'

  belongs_to :week_table,optional: true
  has_many :shifts,dependent: :destroy
  has_many :slacks, through: :shifts

  scope :booked_with, ->(name) { Slack.find_by("name > ?", name).events }

  def to_ics

    event = Icalendar::Event.new
    event.dtstart = Icalendar::Values::DateTime.new self.start_time, tzid: "Asia/Shanghai"
    event.dtend = Icalendar::Values::DateTime.new self.end_time, tzid: "Asia/Shanghai"
    event.summary = self.summary
    event.description = self.calendar_description
    event.created = self.created_at
    event.last_modified = self.updated_at

    #event.url = "#{PUBLIC_URL}events/#{self.id}"
    event
  end

  def all_slacks=(names)
    self.slacks = names.split(",").map do |name|
      Slack.where(name: name.strip).first_or_create!
    end
  end

  def calendar_description
    self.slacks.map{|slack| slack.name.downcase.prepend("@")}.join(", ")
  end

  def all_slacks
    slacks.select("name").map(&:name).join(", ")
  end

end
