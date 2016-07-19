require 'time'

module Hour

  def parse_time(str)
    Time.parse(str)
  end

  def start_hour(time)
    parse_time(time).hour
  end

  def get_hour(str)
    parsed_time = parse_time(str)
    parsed_time.min != 00 ? parsed_time.hour.next : parsed_time.hour
  end

  def pm?(time)
    parse_time(time).hour > 12 ? true : false
  end

end
