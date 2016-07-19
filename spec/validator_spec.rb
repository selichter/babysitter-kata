describe 'Validator module' do
  let(:test_class) { Class.new { include Validator }.new }

  it 'has a #test_method method' do
    expect(test_class.test_method).to eq("This is a test method")
  end

  describe '#valid_start? ' do
    it 'returns true is start time is valid' do
      time = '5pm'
      expect(test_class.valid_start?(time)).to be(true)
    end

    it 'raises an error if the start time is not valid' do
      time = '4pm'
      expect(test_class.valid_start?(time)).to be(false)

    end
  end

end
