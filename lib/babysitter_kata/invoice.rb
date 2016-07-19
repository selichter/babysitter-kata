class BabysitterKata::Invoice

  attr_accessor :start_to_bed_hours,
                :bed_to_midnight_hours,
                :midnight_to_leave_hours

  def initialize( start_to_bed_hours, bed_to_midnight_hours, midnight_to_leave_hours )
    @start_to_bed_hours = start_to_bed_hours
    @bed_to_midnight_hours = bed_to_midnight_hours
    @midnight_to_leave_hours = midnight_to_leave_hours
  end
  # def new_job(start_time, bed_time, leave_time)
  #   job = BabysitterKata::Job.new(start_time, bed_time, leave_time)
  #   calculate_payment(job)
  # end

end
