describe 'Hour module' do
  let(:test_class) { Class.new { include Hour }.new }

  it 'has a #test_method method' do
    expect(test_class.test_method).to eq("I'm testing the Hour module")
  end

  describe '#parse_time' do
    it 'parses times passed to the method as a string' do
      str = "5pm"
      expect(test_class.parse_time(str)).to be_instance_of(Time)
    end
  end

  describe '#get_hour' do
    it 'returns the current hour when time passed is on the hour' do
      leave_time = "1am"
      expect(test_class.get_hour(leave_time)).to eq(1)
    end

    it 'returns the next hour if time passed is not on the hour' do
        leave_time = "1:01am"
        expect(test_class.get_hour(leave_time)).to eq(2)
    end
  end


end
