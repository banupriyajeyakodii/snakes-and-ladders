RSpec.describe 'Snakes_and_ladders' do
  # let(:game) {SnakesLadders.new(token)}
  let(:position) {Position.new(0,0)}
  let(:dice) {Dice.new}
  let(:dice_event) {double(Dice)}
  let(:game) {double(SnakesLadders.new, :player_token => [:X, :Y, :Z])}
  let(:token1) {game.player_token[0]}
  let(:token2) {game.player_token[1]}
  let(:token3) {game.player_token[2]}
  let(:p0)  {position.of(0) }
  let(:p1)  {position.of(1) }
  let(:p4)  {position.of(4) }
  let(:p6)  {position.of(6) }
  let(:p9)  {position.of(9) }
  let(:p12) {position.of(12)}
  let(:p13) {position.of(13)}
  let(:p19) {position.of(19)}
  let(:p27) {position.of(27)}
  let(:p35) {position.of(35)}
  let(:p51) {position.of(51)}
  let(:p97) {position.of(97)}

  context 'play' do
    before (:each) do
      dice_event.stub(:one)   .and_return(1)
      dice_event.stub(:two)   .and_return(2)
      dice_event.stub(:three) .and_return(3)
      dice_event.stub(:four)  .and_return(4)
      dice_event.stub(:five)  .and_return(5)
      dice_event.stub(:six)   .and_return(6)
    end

    it 'should assign tokens to players' do
      expect(token1).to be(:X)
      expect(token2).to be(:Y)
      expect(token3).to be(:Z)
    end
    it 'should not allow token inside the board if dice event is not 1' do
      expect(game.play(dice_event.one, token1, position_of(token1)))
    end

  #   it 'should place(move) tokens according to dice event' do
  #     game.move(:X, dice_event.three, p0x8)
  #     expect(game.token_at(p12)).to include(:X)
  #   end
  #   it 'should allow the current player to play one more time only if event 6 from dice' do
  #     expect{ game.move(:X, dice_event.six, p13) }.to raise_error("X takes another turn.")
  #   end
  #   it 'should allow multiple tokens in a cell' do
  #     game.move(:Y, dice_event.five, p04)
  #     game.move(:X, dice_event.three, p06)
  #     expect(game.token_at(p0x8)).to include(:Y, :X)
  #   end
  #   it 'should not keep the token in the previous position' do
  #     game.move(:X, dice_event.four, p09)
  #     expect(game.token_at(p0x8)).not_to include(:X)
  #   end
  #   it 'should move the token according to corresponding Snakes and ladders' do
  #     game.move(:X, dice_event.two, p51)
  #     expect(game.token_at(p19)).to include(:X)
  #     game.move(:X, dice_event.two, p2x6)
  #     expect(game.token_at(p35)).to include(:X)
  #   end
  # end
  # context 'win Scenario'do
  #   it 'should decalre win if current player token placed in 100th cell' do
      
  #     game.listener {|event|
  #     expect(event).to be_a(WinEvent)
  #     expect(event.winner).to be(:X)
  #     }
  #     game.move(:X, 3, p99)
  #   end
  end
end