class BabysitterKata::Invoice

  def new_job(start_time, bed_time, leave_time)
    BabysitterKata::Job.new(start_time, bed_time, leave_time)
  end
end
