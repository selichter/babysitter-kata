require 'spec_helper'

describe BabysitterKata::Invoice do
  let(:invoice){BabysitterKata::Invoice.new}

  it 'is defined' do
    expect(BabysitterKata::Invoice).to be_a(Class)
  end

  # describe '#new_job' do
  #   it 'creates a new instance of the Job class' do
  #     expect(invoice.new_job('5pm', '8pm', '1am')).to be_a(Integer)
  #   end
  # end

end
