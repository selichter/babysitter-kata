require 'spec_helper'

describe BabysitterKata::Invoice do
  let(:invoice){BabysitterKata::Invoice.new( 3, 2, 1)}

  it 'is defined' do
    expect(BabysitterKata::Invoice).to be_a(Class)
  end

  context 'properties' do
    it 'has start_to_bed_hours' do
      invoice.start_to_bed_hours = 3
      expect(invoice.start_to_bed_hours).to eq(3)
    end

    it 'has a bed_to_midnight_hours' do
      invoice.bed_to_midnight_hours = 2
      expect(invoice.bed_to_midnight_hours).to eq(2)
    end

    it 'has a midnight_to_leave_hours' do
      invoice.midnight_to_leave_hours = 1
      expect(invoice.midnight_to_leave_hours).to eq(1)
    end
  end

  describe '#initialize' do
    it 'accepts start_to_bed_hours, bed_to_midnight_hours, and midnight_to_leave_hours' do
      expect(invoice.start_to_bed_hours).to eq(3)
      expect(invoice.bed_to_midnight_hours).to eq(2)
      expect(invoice.midnight_to_leave_hours).to eq(1)
    end
  end



end
