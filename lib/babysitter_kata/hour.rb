require 'time'

module Hour
  def test_method
     "I'm testing the Hour module"
  end


  def parse_time(str)
    Time.parse(str)
  end

  def get_hour(str)
    parsed_time = parse_time(str)
    parsed_time.min != 00 ? parsed_time.hour.next : parsed_time.hour
  end

end
