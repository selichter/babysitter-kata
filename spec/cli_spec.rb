require 'spec_helper'

describe BabysitterKata::CLI do

  it 'is defined' do
    expect(BabysitterKata::CLI).to be_a(Class)
  end


  describe '#greet_user' do
    it 'Welcomes the user upon call' do
      cli = BabysitterKata::CLI.new

      expect{cli.call}.to output("Welcome\n").to_stdout
    end

  end

  describe '#get_start_time' do
    it 'asks the user for when their job started' do
      cli = BabysitterKata::CLI.new
      expect{cli.get_start_time}.to output("What time did your babysitting job start?\n").to_stdout
    end
  end


end
