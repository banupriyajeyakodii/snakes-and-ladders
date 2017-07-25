RSpec.describe 'Snakes_and_ladders' do

  let(:game) {SnakesLadders.new(:X, :Y)}
  let(:p0x0) {Position.new(0,0)}
  let(:p0x8) {Position.new(0,8)}
  let(:p1x2) {Position.new(1,2)}
  let(:p1x8) {Position.new(1,8)}
  let(:p0x4) {Position.new(0,4)}
  let(:p0x3) {Position.new(0,3)}
  let(:p0x2) {Position.new(0,2)}
  let(:p0x5) {Position.new(0,5)}
  let(:p5x0) {Position.new(5,0)}
  let(:p2x6) {Position.new(2,6)}
  let(:p3x2) {Position.new(3,2)}
    
  it 'should assign tokens to players' do
    expect(game.token1). to be(:X)
    expect(game.token2). to be(:Y)
  end
  context 'play' do
    it 'should allow token inside the board only if event 1 from dice' do
      game.outcome = 1
      game.place(p0x0, :X)
      expect(game.token_at(p0x0)).to include(:X)
    end
    it 'should place(move) tokens according to dice event' do
      game.move(:X, 4, p0x8)
      expect(game.token_at(p1x2)).to include(:X)
    end
    it 'should allow the current player to play one more time only if event 6 from dice' do
      expect{ game.move(:X, 6, p1x2) }.to raise_error("X takes another turn.")
    end
    it 'should allow multiple tokens in a cell' do
      game.move(:Y, 5, p0x3)
      game.move(:X, 3, p0x5)
      expect(game.token_at(p0x8)).to include(:Y, :X)
    end
    it 'should not keep the token in the previous position' do
      game.move(:X, 4, p0x8)
      expect(game.token_at(p0x8)).not_to include(:X)
    end
    it 'should shift down the token to the snake tail cell if the token placed in snake head' do
      game.shift(:X, 2, p5x0)
      expect(game.token_at(p1x8)).to include(:X)
    end
    it 'should shift up the token to the ladder top cell if the token placed in ladder bottom cell' do
      game.shift(:X, 2, p2x6)
      expect(game.token_at(p3x2)).to include(:X)
    end
  end
  context 'win Scenario'do
    it 'should decalre win if current player token placed in 100th cell' do
      
    end
  end
end