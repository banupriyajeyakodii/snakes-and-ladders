RSpec.describe 'Snakes_and_ladders' do

  let(:game) {SnakesLadders.new(:X, :Y)}
  let(:p0x0) {Position.new(0,0)}
  let(:p0x3) {Position.new(0,3)}
  let(:p0x5) {Position.new(0,5)}
  let(:p0x8) {Position.new(0,8)}
  let(:p1x1) {Position.new(1,1)}
  let(:p1x2) {Position.new(1,2)}
  let(:p1x8) {Position.new(1,8)}
  let(:p2x6) {Position.new(2,6)}
  let(:p3x2) {Position.new(3,2)}
  let(:p5x0) {Position.new(5,0)}
  let(:p9x6) {Position.new(9,6)}
    
  it 'should assign tokens to players' do
    expect(game.token1). to be(:X)
    expect(game.token2). to be(:Y)
  end
  context 'play' do
    it 'should allow token inside the board only if event 1 from dice' do
      game.outcome = 1
      game.enter(:X)
      expect(game.token_at(p0x0)).to include(:X)
    end
    it 'should place(move) tokens according to dice event' do
      game.move(:X, 3, p0x8)
      expect(game.token_at(p1x1)).to include(:X)
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
    it 'should move the token according to corresponding Snakes and ladders' do
      game.move(:X, 2, p5x0)
      expect(game.token_at(p1x8)).to include(:X)
      game.move(:X, 2, p2x6)
      expect(game.token_at(p3x2)).to include(:X)
    end
    it 'shoul call' do
      check = Console.new
      x = check.a
      byebug
    end
    end
  end
  context 'win Scenario'do
    it 'should decalre win if current player token placed in 100th cell' do
      
      game.listener {|event|
      expect(event).to be_a(WinEvent)
      expect(event.winner).to be(:X)
      }
      game.move(:X, 3, p9x6)
    end
  end
end