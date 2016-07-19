require 'time'
require_relative './hour.rb'
require_relative './validator.rb'

class BabysitterKata::Job
  include Hour
  include Validator

  MIDNIGHT = 24

  attr_accessor :start_time,
                :bed_time,
                :leave_time

  def initialize( start_time, bed_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  def start_to_bed_hours
    if pm?(@bed_time)
      get_hour(@bed_time) - start_hour(@start_time)
    else
      MIDNIGHT - start_hour(@start_time) + get_hour(@bed_time)
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
    invoice = BabysitterKata::Invoice.new(start_to_bed_hours, bed_to_midnight_hours, midnight_to_leave_hours)
    invoice.total_pmt
  end

end
