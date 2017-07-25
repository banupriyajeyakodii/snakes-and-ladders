RSpec.describe Position do
  it 'should provide x and y coordinate' do
    p = Position.new(2, 3)
    expect(p.x).to eq(2)
    expect(p.y).to eq(3)
  end
  it 'should move horizontally according dice outcome' do
    starting = Position.new(0, 8)
    ending = starting + (3)
    expected = Position.new(1, 1)
    expect([ending.x, ending.y]).to eq([expected.x, expected.y])
  end
end