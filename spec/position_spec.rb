RSpec.describe 'Position' do
  
  it 'should provide x and y coordinate by cell number' do
    position = Game::Position.of(24)
    expect(position.x).to eq(2)
    expect(position.y).to eq(4)
  end

  it 'should be equal with new position object' do
    expect(Game::Position.of(24)).to eq(Game::Position.of(24))
  end


  it 'should add to position' do
    expect(Game::Position.of(24).add(3)).to eq(Game::Position.of(27))
  end

  it 'should compare position 24 to be greater than position 22' do
    expect(Game::Position.of(24)).to be > Game::Position.of(22)
  end

  
  
end