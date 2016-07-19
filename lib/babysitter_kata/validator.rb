require_relative './hour.rb'

module Validator
  include Hour

  AVAILABLE_START_TIME = 17
  LEAVE_BY = 4

  def test_method
    "This is a test method"
  end

  def valid_start?(time)
    parse_time(time).hour >= AVAILABLE_START_TIME ? true: false
  end

end
