class Ical < Icalendar::Calendar
  require 'icalendar/tzinfo'

  def initialize(cal)

    event_start = DateTime.new
    event_end = DateTime.new
    tzid = "America/Chicago"
    tz = TZInfo::Timezone.get tzid
    timezone = tz.ical_timezone event_start
    self.add_timezone timezone
    self.event do |e|
    e.dtstart = Icalendar::Values::DateTime.new event_start, 'tzid' => tzid
    e.dtend   = Icalendar::Values::DateTime.new event_end, 'tzid' => tzid
    end
  end
end
