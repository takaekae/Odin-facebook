module ApplicationHelper
  def convert_to_eastern_time(time)
    time.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y %H:%M EST")
  end
end
