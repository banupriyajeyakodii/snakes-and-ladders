RSpec.describe 'SnakesLadders' do
  let(:token1) { :X }
  let(:token1) { :Y }
  let(:token1) { :Z }

  let(:position) { Game::Position.new(0,0) }
  let(:dice) { mock(Dice) }

  let(:game) {Game::SnakesLadders.new(dice, token1, token2, token3)}


  let(:first_cell)  {position.of(1) }
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
      dice_event.stub(:one)   .and_return(1)
      dice_event.stub(:two)   .and_return(2)
      dice_event.stub(:three) .and_return(3)
      dice_event.stub(:four)  .and_return(4)
      dice_event.stub(:five)  .and_return(5)
      dice_event.stub(:six)   .and_return(6)
    end

    it 'should allow player :X to play first' do
      expect(game.current_player).to be(:X)
    end

    it 'should not allow entry if dice outcome is other than 1' do
      dice.stub!(:roll).and_return(2)
      game.play
      expect(game.position_of(:X)).to be(Position.EMPTY)
    end

    it 'should allow entry when dice outcome is 1' do
      dice.stub!(:roll).and_return(1)
      game.play
      expect(game.position_of(:X)).to eq(first_cell)
    end

    context 'player turns' do
      let(:dice) { mock(Dice) }
      it 'should alternate between players' do


        expect(game.current_token).to be(:Y)
      end
      it 'should allow player to repeat when dice outcome is 6'
    end



    it 'should allow player enter the board if the dice outcome is 1 and allow next player to play.' do
      game.player = token1
      game.outcome = dice_event.one
      game.play
      expect(game.token_at(p1)).to include(:X)
      expect(game.player).to be(token2)
    end
    it 'should not allow token inside the board if dice event is not 1 and allow next player to play.' do
      game.player = token1
      game.outcome = dice_event.two
      game.play
      expect(game.is_in_board?).to be_falsey
      expect(game.player).to be(token2)
      expect(game.play).to eq("Better luck next time!")   # => YAGNI dilemma
    end
    it 'should move 5 places if dice event is 5 and allownext player to play.' do
      game.stub(:is_in_board?) { true }           # => didn't double the object
      game.player = token2



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