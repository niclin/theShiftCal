module EventsHelper
  require 'chronic'
 


  def set_up_shift_time(chronic_time)
    Chronic.parse(chronic_time).strftime('%Y-%m-%d %H:%M:%S')

  end
end
