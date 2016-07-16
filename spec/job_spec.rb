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

  describe '#format_start_time' do
    it 'returns an integer' do
      expect(job.format_start_time).to be_a(Integer)
    end

    it 'returns the start time hour' do
      expect(job.format_start_time).to eq(17)
    end
  end

  describe '#format_bed_time' do
    it 'returns an integer' do
      expect(job.format_bed_time).to be_a(Integer)
    end

    it 'returns the bed_time hour when bedtime is on the hour' do
      job.bed_time = "8pm"
      expect(job.format_bed_time).to eq(20)
    end

    it 'returns the next hour if bed time is not on the hour' do
        job.bed_time = "8:01pm"
        expect(job.format_bed_time).to eq(21)
    end
  end

  describe '#format_leave_time' do
    it 'returns an integer' do
      expect(job.format_leave_time).to be_a(Integer)
    end

    it 'returns the leave_time hour when leave_time is on the hour' do
      job.leave_time = "1am"
      expect(job.format_leave_time).to eq(1)
    end

    it 'returns the next hour if leave_time is not on the hour' do
        job.leave_time = "1:01am"
        expect(job.format_leave_time).to eq(2)
    end
  end

  describe 'start_to_bed_hours' do
    it 'returns an integer' do
      expect(job.start_to_bed_hours).to be_a(Integer)
    end

    it 'can calculate the difference between start and bed time' do
      expect(job.start_to_bed_hours).to eq(3)
    end

  end

  describe 'bed_to_midnight_hours' do
    it 'returns an integer' do
      expect(job.bed_to_midnight_hours).to be_a(Integer)
    end

    it 'can calculate the difference between bedtime and midnight' do
      expect(job.bed_to_midnight_hours).to eq(4)
    end

  end




end
