require 'time'
require_relative './hour.rb'

class BabysitterKata::Job
  include Hour

  AVAILABLE_START_TIME = 17
  LEAVE_BY = 4
  MIDNIGHT = 24
  START_TO_BED_RATE = 12
  BED_TO_MIDNIGHT_RATE = 8
  MIDNIGHT_TO_LEAVE_RATE = 16


  attr_accessor :start_time,
                :bed_time,
                :leave_time

  def initialize( start_time, bed_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  # deals with hour conversion/formatting
  # this method isn't about the time being before midnight, but more about it being between 5 and midnight...
  #is this actually a validation?
  def before_midnight?(time)
    get_hour(time) >= AVAILABLE_START_TIME && get_hour(time) <= MIDNIGHT ? true : false
  end

  # Calculates a time period
  def start_to_bed_hours
    if before_midnight?(@bed_time) === true
      get_hour(@bed_time) - parse_time(@start_time).hour
    else
      MIDNIGHT - parse_time(@start_time).hour + get_hour(@bed_time)
    end
  end

# Calculates a time period
  def bed_to_midnight_hours
    MIDNIGHT - get_hour(@bed_time)
  end
# Calculates a time period
  def bed_to_leave_hours
    get_hour(@leave_time) - get_hour(@bed_time)
  end
# Calculates a time period
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
