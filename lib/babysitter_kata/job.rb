class BabysitterKata::Job
  attr_accessor :start_time,
                :bed_time,
                :leave_time

  def initialize(bed_time, start_time = "5pm", leave_time = '4am')
    @start_time = start_time
    @bed_time = bed_time
    @leave_time = leave_time
  end

end
