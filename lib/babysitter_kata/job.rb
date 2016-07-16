require 'time'

class BabysitterKata::Job
  attr_accessor :start_time,
                :bed_time,
                :leave_time

  def initialize(bed_time, start_time, leave_time )
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

  def format_start_time
     Time.parse(@start_time).hour
  end

  def format_bed_time
    if Time.parse(@bed_time).min != 00
      Time.parse(@bed_time).hour.next
    else
      Time.parse(@bed_time).hour
    end
  end

  def format_leave_time
    if Time.parse(@leave_time).min != 00
      Time.parse(@leave_time).hour.next
    else
      Time.parse(@leave_time).hour
    end
  end

  def start_to_bed_hours
    format_bed_time - format_start_time
  end

  def bed_to_midnight_hours
    24 - format_bed_time
  end

  def midnight_to_leave_hours
    format_leave_time - 0
  end


end
