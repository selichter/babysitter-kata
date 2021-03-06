class BabysitterKata::Invoice

  START_TO_BED_RATE = 12
  BED_TO_MIDNIGHT_RATE = 8
  MIDNIGHT_TO_LEAVE_RATE = 16

  attr_accessor :start_to_bed_hours,
                :bed_to_midnight_hours,
                :midnight_to_leave_hours

  def initialize( start_to_bed_hours, bed_to_midnight_hours, midnight_to_leave_hours )
    @start_to_bed_hours = start_to_bed_hours
    @bed_to_midnight_hours = bed_to_midnight_hours
    @midnight_to_leave_hours = midnight_to_leave_hours
  end


  def start_to_bed_pmt
    @start_to_bed_hours * START_TO_BED_RATE
  end

  def bed_to_midnight_pmt
    @bed_to_midnight_hours * BED_TO_MIDNIGHT_RATE
  end

  def midnight_to_leave_pmt
    @midnight_to_leave_hours * MIDNIGHT_TO_LEAVE_RATE
  end

  def total_pmt
    start_to_bed_pmt + bed_to_midnight_pmt + midnight_to_leave_pmt
  end

end
