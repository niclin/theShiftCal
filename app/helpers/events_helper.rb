module EventsHelper
  def slack_links(slakcs)
  slacks.split(",").map{|slack| link_to slack.strip, slack_path(slack.strip) }.join(", ")
end
end
