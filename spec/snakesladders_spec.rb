RSpec.describe 'Snakes_and_ladders' do

  let(:game) {SnakesLadders.new(:X, :Y)}
  let(:dice_event) {double()}                    
  let(:dice) {Dice.new}
  let(:p0x0) {Position.new(0,0)}
  let(:p0x3) {Position.new(0,3)}
  let(:p0x5) {Position.new(0,5)}
  let(:p0x8) {Position.new(0,8)}
  let(:p1x1) {Position.new(1,1)}
  let(:p1x2) {Position.new(1,2)}
  let(:p1x8) {Position.new(1,8)}
  let(:p2x6) {Position.new(2,6)}
  let(:p3x4) {Position.new(3,4)}
  let(:p5x0) {Position.new(5,0)}
  let(:p9x6) {Position.new(9,6)}

  it 'should assign tokens to players' do
    expect(game.token1).to be(:X)
    expect(game.token2).to be(:Y)
  end
  context 'play' do
      before (:each) do
        dice_event.stub(:one)   .and_return(1)
        dice_event.stub(:two)   .and_return(2)
        dice_event.stub(:three) .and_return(3)
        dice_event.stub(:four)  .and_return(4)
        dice_event.stub(:five)  .and_return(5)
        dice_event.stub(:six)   .and_return(6)
      end
    it 'should allow token inside the board only if event 1 from dice' do
      game.outcome = dice_event.one
      game.enter(:X)
      expect(game.token_at(p0x0)).to include(:X)
    end
    it 'should place(move) tokens according to dice event' do
      game.move(:X, dice_event.three, p0x8)
      expect(game.token_at(p1x1)).to include(:X)
    end
    it 'should allow the current player to play one more time only if event 6 from dice' do
      expect{ game.move(:X, dice_event.six, p1x2) }.to raise_error("X takes another turn.")
    end
    it 'should allow multiple tokens in a cell' do
      game.move(:Y, dice_event.five, p0x3)
      game.move(:X, dice_event.three, p0x5)
      expect(game.token_at(p0x8)).to include(:Y, :X)
    end
    it 'should not keep the token in the previous position' do
      game.move(:X, dice_event.four, p0x8)
      expect(game.token_at(p0x8)).not_to include(:X)
    end
    it 'should move the token according to corresponding Snakes and ladders' do
      game.move(:X, dice_event.two, p5x0)
      expect(game.token_at(p1x8)).to include(:X)
      game.move(:X, dice_event.two, p2x6)
      expect(game.token_at(p3x4)).to include(:X)
    end
    # it 'shoul call' do
    #   check = Console.new
    #   x = check.a
    #   byebug
    # end
    # end
  end
  context 'win Scenario'do
    it 'should decalre win if current player token placed in 100th cell' do
      
      # game.listener {|event|
      # expect(event).to be_a(WinEvent)
      # expect(event.winner).to be(:X)
      # }
      # game.move(:X, 3, p9x6)
    end
  end
end