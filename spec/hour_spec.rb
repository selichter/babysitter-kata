describe 'Hour module' do
  let(:test_class) { Class.new { include Hour }.new }

  it 'has a #test_method method' do
    expect(test_class.test_method).to eq("I'm testing the Hour module")
  end


end
