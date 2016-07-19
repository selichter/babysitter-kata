require 'time'
require_relative './hour.rb'
require_relative './validator.rb'

class BabysitterKata::Job
  include Hour
  include Validator


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
  # the problem with this is that we're calculating whether or not a time is before midnight by the available start time - not by referencing midnight. This makes moving the method to the hour module as is a bad idea.
  # should I insted be looking for the time being am/pm?
  def before_midnight?(time)
    get_hour(time) >= AVAILABLE_START_TIME && get_hour(time) <= MIDNIGHT ? true : false
  end

  def start_to_bed_hours
    if get_hour(@bed_time) >= AVAILABLE_START_TIME && get_hour(@bed_time) <= MIDNIGHT
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
    if !valid_start?(@start_time)
      raise StandardError, 'The earliest available start time is 5pm.'
    elsif !valid_leave?(@leave_time)
      raise StandardError, 'The sitter must leave by 4am.'
    end
  end

  def calculate_payment
    validate_times
     start_to_bed_hours * START_TO_BED_RATE + bed_to_midnight_hours * BED_TO_MIDNIGHT_RATE + midnight_to_leave_hours * MIDNIGHT_TO_LEAVE_RATE
  end

end
