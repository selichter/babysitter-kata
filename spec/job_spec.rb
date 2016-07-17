require 'spec_helper'

describe BabysitterKata::Job do

  let(:job){BabysitterKata::Job.new("8pm", "5pm", "1am")}

  it 'is defined' do
    expect(BabysitterKata::Job).to be_a(Class)
  end

  context 'properties' do
    it 'has a start_time' do
      job.start_time = "8 pm"
      expect(job.start_time).to eq("8 pm")
    end

    it 'has a bed_time' do
      job.bed_time = "10 pm"
      expect(job.bed_time).to eq("10 pm")
    end

    it 'has a leave_time' do
      job.leave_time = "1 am"
      expect(job.leave_time).to eq("1 am")
    end
  end

  describe 'initialize' do
    it 'accepts a start_time, bed_time, and leave_time' do
      expect(job.start_time).to eq("5pm")
      expect(job.bed_time).to eq("8pm")
      expect(job.leave_time).to eq("1am")
    end
  end

  describe '#parse_time' do
    it 'parses times passed to the method as a string' do
      str = "5pm"
      expect(job.parse_time(str)).to be_instance_of(Time)
    end
  end

  describe '#get_hour' do
    it 'returns the current hour when time passed is on the hour' do
      leave_time = "1am"
      expect(job.get_hour(leave_time)).to eq(1)
    end

    it 'returns the next hour if time passed is not on the hour' do
        leave_time = "1:01am"
        expect(job.get_hour(leave_time)).to eq(2)
    end
  end

  # describe '#parse_bed_time' do
  #   it 'returns the bed_time hour when bedtime is on the hour' do
  #     job.bed_time = "8pm"
  #     expect(job.parse_bed_time).to eq(20)
  #   end
  #
  #   it 'returns the next hour if bed time is not on the hour' do
  #       job.bed_time = "8:01pm"
  #       expect(job.parse_bed_time).to eq(21)
  #   end
  # end
  #
  # describe '#parse_leave_time' do
  #   it 'returns the leave_time hour when leave_time is on the hour' do
  #     job.leave_time = "1am"
  #     expect(job.parse_leave_time).to eq(1)
  #   end
  #
  #   it 'returns the next hour if leave_time is not on the hour' do
  #       job.leave_time = "1:01am"
  #       expect(job.parse_leave_time).to eq(2)
  #   end
  # end

  describe '#start_to_bed_hours' do
    it 'can calculate the difference between start and bed time when bed is before midnight' do
      expect(job.start_to_bed_hours).to eq(3)
    end

    it 'can calculate difference if bed time is after midnight' do
      job.bed_time = "1am"
      expect(job.start_to_bed_hours).to be(8)
    end

  end

  describe '#bed_before_midnight?' do
    it 'returns true if bedtime is before midnnight' do
      job.bed_time = "11pm"
      expect(job.bed_before_midnight?).to eq(true)
    end

    it 'returns false if bedtime is after midnnight' do
      job.bed_time = "1am"
      expect(job.bed_before_midnight?).to eq(false)
    end

  end

  describe '#bed_to_midnight_hours' do
    it 'can calculate the difference between bedtime and midnight' do
      expect(job.bed_to_midnight_hours).to eq(4)
    end

  end

  describe '#midnight_to_leave_hours' do
    it 'can calculate the difference between bedtime and midnight' do
      expect(job.midnight_to_leave_hours).to eq(1)
    end
  end

  describe '#validate_times' do

    it 'raises an error if the start time is before the available start time' do
      job.start_time = '2pm'
      expect {job.validate_times}.to raise_error(StandardError)
    end

    it 'raises an error if the leave time is after 4am' do
      job.start_time = '5pm'
      job.leave_time = '5am'
      expect {job.validate_times}.to raise_error(StandardError)
    end

  end

  describe '#calculate_payment' do
    it 'can calculate the total payment' do
      expect(job.calculate_payment).to eq(84)
    end
  end

end
