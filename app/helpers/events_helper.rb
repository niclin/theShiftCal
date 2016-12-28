module EventsHelper
  require 'chronic'
  def slack_links(slakcs)
  slacks.split(",").map{|slack| link_to slack.strip, slack_path(slack.strip) }.join(", ")
end


  def set_up_shift_time(chronic_time)
    Chronic.parse(chronic_time).strftime('%Y-%m-%d %H:%M:%S')

  end
end
