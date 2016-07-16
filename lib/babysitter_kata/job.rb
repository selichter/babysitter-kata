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


end
