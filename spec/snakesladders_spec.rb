RSpec.describe 'SnakesLadders' do
  # let(:game) {SnakesLadders.new(token)}
  let(:position) {Game::Position.new(0,0)}
  let(:dice) {Dice.new}
  let(:dice_event) {double(Dice)}
  let(:game) {double(Game::SnakesLadders.new, :token => [:X, :Y, :Z])}
  let(:token1) {game.token[0]}
  let(:token2) {game.token[1]}
  let(:token3) {game.token[2]}
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

  context 'game' do
    before (:each) do
      # game.board
      # game.stub(:token_in)    .and_return(true)
      # game.stub(:token_out)   .and_return(false)
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
    it 'should allow token inside the board if the dice event is 1' do
      # game.player = token1
      # # game.stub(:is_in_board?(token1)) { true } 
      # game.is_in_board? = false
      # game.outcome = dice_event.one
      # allow(:play).to receive(player: token1, is_in_board?: false, outcome: 1)
      # game.play
      # expect(p1).to include(:Y)
      
    end
    it 'should not allow token inside the board if dice event is not 1' do
      # game.is_in_board?(token1) = false
      # game.outcome = dice_event.two
      # game.play
      # expect().
      # expect
    end

  #   it 'should place(move) tokens according to dice event' do
  #   end
  #   it 'should allow the current player to play one more time only if event 6 from dice' do
  #   end
  #   it 'should allow multiple tokens in a cell' do
  #   end
  #   end
  #   it 'should move the token according to corresponding Snakes and ladders' do
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