class BabysitterKata::Invoice

  attr_accessor :start_to_bed_hours,
                :bed_to_midnight_hours,
                :midnight_to_leave_hours

  def initialize( start_to_bed_hours, bed_to_midnight_hours, midnight_to_leave_hours )
    @start_to_bed_hours = start_to_bed_hours
    @bed_to_midnight_hours = bed_to_midnight_hours
    @midnight_to_leave_hours = midnight_to_leave_hours
  end




  # def calculate_payment
  #   validate_times
  #    start_to_bed_hours * START_TO_BED_RATE + bed_to_midnight_hours * BED_TO_MIDNIGHT_RATE + midnight_to_leave_hours * MIDNIGHT_TO_LEAVE_RATE
  # end

end
