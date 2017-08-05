RSpec.describe SnakesNLadders do
  let(:position) { Game::Position.new(0,0) }
  let(:dice) { object_double(Dice.new) }
  let(:game) { SnakesNLadders.new(dice, :X, :Y) }

  context "Game Start" do

    it 'player X should play first' do
      expect(game.current_player).to be(:X)
    end

    it 'players will take turns alternatively' do
      allow(dice).to receive(:roll).and_return(rand(1..5))
      game.play
      expect(game.current_player).to be(:Y)
    end
    it 'player can play again when he rolls 6' do
      allow(dice).to receive(:roll).and_return(6)
      game.play
      expect(game.current_player).to be(:X)
    end

    it 'players will keep rolling until they roll 1' do
      allow(dice).to receive(:roll).and_return(rand(2..6))
      game.play
      game.play
      game.play
      game.play
      expect(game.position_of(:X)).to eq(Game::Position::NONE)
      expect(game.position_of(:Y)).to eq(Game::Position::NONE)
    end
    it 'player can enter the board after rolling 1' do
      allow(dice).to receive(:roll).and_return(1)
      game.play
      expect(game.position_of(:X)).to eq(Game::Position.of(1))
    end

  end

  context "Game Play" do
    let(:game) { SnakesNLadders.new(dice, :X, :Y, {X: Game::Position.of(4), Y: Game::Position.of(11), current_player: :Y}) }
    
    it 'players will take turns alternatively' do
      allow(dice).to receive(:roll).and_return(3)
      game.play
      game.play
      game.play
      game.play
      expect(game.position_of(:X)).to eq(Game::Position.of(10))
      expect(game.position_of(:Y)).to eq(Game::Position.of(17))
    end

    it 'should allow current player to play first' do
      expect(game.current_player).to be(:Y)
    end

    it 'player can play again when he rolls 6' do
      allow(dice).to receive(:roll).and_return(6)
      game.play
      expect(game.current_player).to be(:Y)
    end

    it 'player shall move according to the number rolled from the current position' do
      allow(dice).to receive(:roll).and_return(3)
      game.play
      expect(game.position_of(:Y)).to eq(Game::Position.of(14))
      game.play
      expect(game.position_of(:X)).to eq(Game::Position.of(7))
    end
    it 'player is taken to top of the ladder if he lands at the bottom of a ladder' do
      allow(dice).to receive(:roll).and_return(5)
      game.play
      expect(game.position_of(:Y)).to eq(Game::Position.of(29))
    end
    it 'player is taken to the bottom of the chute if he lands on top of a chute' do
      allow(dice).to receive(:roll).and_return(4)
      game.play
      expect(game.position_of(:Y)).to eq(Game::Position.of(7))
    end
  end
  
  it 'player who reaches 100 is the winner'
  

end