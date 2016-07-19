require 'spec_helper'

describe BabysitterKata::Job do

  let(:job){BabysitterKata::Job.new("5pm", "8pm", "1am")}

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

  describe '#initialize' do
    it 'accepts a start_time, bed_time, and leave_time' do
      expect(job.start_time).to eq("5pm")
      expect(job.bed_time).to eq("8pm")
      expect(job.leave_time).to eq("1am")
    end
  end

  describe '#start_to_bed_hours' do
    it 'can calculate the difference between start and bed time when bed is before midnight' do
      expect(job.start_to_bed_hours).to eq(3)
    end

    it 'can calculate difference if bed time is after midnight' do
      job.bed_time = "1am"
      expect(job.start_to_bed_hours).to be(8)
    end
  end

  describe '#bed_to_midnight_hours' do
    it 'can calculate the difference between bedtime and midnight' do
      expect(job.bed_to_midnight_hours).to eq(4)
    end
  end

  describe '#bed_to_leave_hours' do
    it 'can calculate the difference between bed and leave times' do
      job.leave_time = "10pm"
      expect(job.bed_to_leave_hours).to eq(2)
    end
  end

  describe '#midnight_to_leave_hours' do
    it 'calculates the difference between bedtime and midnight when bed is after midnight' do
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
    it 'creates a new instance of the Invoice class' do
      invoice = BabysitterKata::Invoice.new(2, 3, 1)
      expect(invoice).to be_a(Object)
    end

    it 'returns the total payment as calculated by the invoice' do
      invoice = BabysitterKata::Invoice.new(2, 3, 1)
      expect(invoice.total_pmt).to eq(64)
    end

    it 'returns the total payment when bed time is after midnight' do
      job.bed_time = "1am"
      invoice = BabysitterKata::Invoice.new(7, 0, 3)
      expect(invoice.total_pmt).to eq(132)
    end

  end

end
