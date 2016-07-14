require 'spec_helper'

describe BabysitterKata::Job do

  let(:job){BabysitterKata::Job.new}

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





end
