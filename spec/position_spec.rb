RSpec.describe 'Position' do
    let(:position) { Game::Position.new(2, 3) }
  it 'should provide x and y coordinate by cell number' do
    position.of(24)
    expect(position.x).to eq(2)
    expect(position.y).to eq(3)
  end
  it 'should be equal with new position object' do
    old_object = position.of(24)
    new_object = Game::Position.new(old_object.x , old_object.y)
    expect(old_object == new_object).to be_truthy
  end
  it 'object should be able to add with an integer' do
    source = position.of(9)
    destination = source + 3
    expected = position.of(12)
    expect(destination).to eq(expected)
  end
  it 'should check for any wormhole in given position' do
    expect(position.of(89).has_wormhole?).to be_truthy
    expect(position.of(9).has_wormhole?).to be_falsey
  end
  
  
end