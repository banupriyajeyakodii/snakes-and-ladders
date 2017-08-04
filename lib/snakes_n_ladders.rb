class SnakesNLadders

  def initialize(dice, first_player, second_player, state = nil)
    @players = [first_player, second_player]
    if(state.nil?)
      @player_positions = {first_player => Game::Position::NONE, second_player => Game::Position::NONE }
    @current_player = first_player
    else
      @player_positions = {first_player => state[first_player], second_player => state[second_player], :current_player => current_player}
    @current_player = state[:current_player]
    end
    @dice = dice

  end

  attr_reader :current_player, :dice

  def play
    outcome = dice.roll()
    (position_of(current_player) > Game::Position::NONE) ? move(current_player, outcome) :  ( move(current_player, outcome) if(outcome == 1))
    change_player() if(outcome != 6)
  end

  def position_of(player)
    @player_positions[player]
  end

  private
  def change_player
    @current_player = current_player == players[0] ? players[1] : players[0]
  end

  def move(player, outcome)
    @player_positions[player] = @player_positions[player].add(outcome)
  end
  attr_reader :players

end