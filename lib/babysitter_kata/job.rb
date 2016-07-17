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

  def initialize(bed_time, start_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  def parse_time(str)
    Time.parse(str)
  end

  def parse_start_time
     Time.parse(@start_time).hour
  end

  def parse_bed_time
    bed = Time.parse(@bed_time)
    bed.min != 00 ? bed.hour.next : bed.hour
  end


  def bed_before_midnight?
    parse_bed_time > AVAILABLE_START_TIME ? true : false
  end

  def parse_leave_time
    leave = Time.parse(@leave_time)
    leave.min != 00 ? leave.hour.next : leave.hour
  end

  def start_to_bed_hours
    if bed_before_midnight?
      parse_bed_time - parse_start_time
    else
      (MIDNIGHT - parse_start_time) + (parse_bed_time)
    end
  end

  def bed_to_midnight_hours
    MIDNIGHT - parse_bed_time
  end

  def midnight_to_leave_hours
    parse_leave_time - 0
  end

  def validate_times
    if parse_time(@start_time).hour < AVAILABLE_START_TIME
      raise StandardError, 'The earliest available start time is 5pm.'
    elsif parse_leave_time > LEAVE_BY
      raise StandardError, 'The sitter must leave by 4am.'
    end
  end


  def calculate_payment
    validate_times
    (start_to_bed_hours * START_TO_BED_RATE) + (bed_to_midnight_hours * BED_TO_MIDNIGHT_RATE) + (midnight_to_leave_hours * MIDNIGHT_TO_LEAVE_RATE)
  end

end
