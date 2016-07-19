describe 'Validator module' do
  let(:test_class) { Class.new { include Validator }.new }

  it 'has a #test_method method' do
    expect(test_class.test_method).to eq("This is a test method")
  end

end
