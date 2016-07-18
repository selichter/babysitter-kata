require 'time'

class BabysitterKata::Job
  attr_accessor :start_time,
                :bed_time,
                :leave_time

  AVAILABLE_START_TIME = 17
  LEAVE_BY = 4
  MIDNIGHT = 24
  START_TO_BED_RATE = 12
  BED_TO_MIDNIGHT_RATE = 8
  MIDNIGHT_TO_LEAVE_RATE = 16

  def initialize( start_time, bed_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  def parse_time(str)
    Time.parse(str)
  end

  def get_hour(str)
    parsed_time = parse_time(str)
    parsed_time.min != 00 ? parsed_time.hour.next : parsed_time.hour
  end

  def before_midnight?(time)
    get_hour(time) >= AVAILABLE_START_TIME && get_hour(time) <= MIDNIGHT ? true : false
  end

  def start_to_bed_hours
    if before_midnight?(@bed_time) === true
      get_hour(@bed_time) - parse_time(@start_time).hour
    else
      MIDNIGHT - parse_time(@start_time).hour + get_hour(@bed_time)
    end
  end

  def bed_to_midnight_hours
    MIDNIGHT - get_hour(@bed_time)
  end

  def bed_to_leave_hours
    get_hour(@leave_time) - get_hour(@bed_time)
  end

  def midnight_to_leave_hours
    get_hour(@leave_time)
  end

  def validate_times
    if parse_time(@start_time).hour < AVAILABLE_START_TIME
      raise StandardError, 'The earliest available start time is 5pm.'
    elsif get_hour(@leave_time) > LEAVE_BY
      raise StandardError, 'The sitter must leave by 4am.'
    end
  end

  def calculate_payment
    validate_times
     start_to_bed_hours * START_TO_BED_RATE + bed_to_midnight_hours * BED_TO_MIDNIGHT_RATE + midnight_to_leave_hours * MIDNIGHT_TO_LEAVE_RATE
    
  end

end
