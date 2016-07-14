require 'spec_helper'

describe BabysitterKata::CLI do

  it 'is defined' do
    expect(BabysitterKata::CLI).to be_a(Class)
  end

  it 'Welcomes the user upon call' do
    cli = BabysitterKata::CLI.new

    expect{cli.call}.to output("Welcome\n").to_stdout
  end



end
