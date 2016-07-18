require 'spec_helper'

describe BabysitterKata::Invoice do
  let(:invoice){BabysitterKata::Invoice.new}

  it 'is defined' do
    expect(BabysitterKata::Invoice).to be_a(Class)
  end

  describe '#new_job' do
    it 'creates a new instance of the Job class' do
      expect(invoice.new_job('5pm', '8pm', '1am')).to be_a(Integer)
    end
  end

  describe '#calculate_payment' do
    it 'can calculate the total payment' do
      job = BabysitterKata::Job.new('5pm', '8pm', '1am')
      expect(invoice.calculate_payment(job)).to eq(76)
    end
  end


end
