describe 'Hour module' do
  let(:test_class) { Class.new { include Hour }.new }

  describe '#parse_time' do
    it 'parses times passed to the method as a string' do
      str = "5pm"
      expect(test_class.parse_time(str)).to be_instance_of(Time)
    end
  end

  describe '#start_hour' do
    time = "5pm"
    it 'returns an integer' do
      expect(test_class.start_hour(time)).to be_a(Integer)
    end

    it 'returns the correct hour for the given start time' do
      expect(test_class.start_hour(time)).to be(17)
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

  describe 'pm?' do
    it 'returns true if the time is pm' do
      time = "5pm"
      expect(test_class.pm?(time)).to be(true)
    end

    it 'returns false if the time is am' do
      time = "1am"
      expect(test_class.pm?(time)).to be(false)
    end
  end


end
