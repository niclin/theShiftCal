class Event < ApplicationRecord
require 'icalendar/tzinfo'

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


  belongs_to :week_table,optional: true
  has_many :shifts,dependent: :destroy
  has_many :slacks, through: :shifts

  def all_slacks=(names)
    self.slacks = names.split(",").map do |name|
      Slack.where(name: name.strip).first_or_create!
    end

  end

  def calendar_description
     self.slacks.map{|slack| slack.name.downcase.prepend("@")}.join(", ")

  end


  def all_slacks
    self.slacks.map(&:name).join(", ")

  end

  def self.booked_with(name)
    Slack.find_by_name!(name).events

  end



end
