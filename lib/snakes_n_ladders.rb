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
    unless game_finished?
      outcome = dice.roll()
      if (position_of(current_player) > Game::Position::NONE) 
        move(current_player, outcome) 
      else  
        move(current_player, outcome) if(outcome == 1)
      end
      check_if_win
      change_player() if(outcome != 6)
    end
  end

  def position_of(player)
    @player_positions[player]
  end

  def add_listener(&observer)
    @observer = observer
  end

  def game_finished?
    check_if_win()
  end

  private
  def change_player
    @current_player = current_player == players[0] ? players[1] : players[0]
  end

  def move(player, outcome)
    @player_positions[player] = @player_positions[player].add(outcome)
    transport if has_snakes_or_ladders? 

  end

  def player_index
    @player_positions[current_player].number
  end

  def snakes_and_ladders
    snakes = Hash[(1..6).map { |e| [(e*15), e*7] }]
    ladders = Hash[(1..6).map {|i| [i*8, i*17-5]}]
    snakes.merge(ladders)
  end

  def has_snakes_or_ladders?
    snakes_and_ladders.keys.any?{ |source| source == player_index  }
  end

  def transport
    @player_positions[current_player] = Game::Position.of(snakes_and_ladders[player_index])
    move(current_player, 0)
  end

  def check_if_win
    is_win = (position_of(current_player) == Game::Position.of(100))
    @observer.call(WinEvent.new(current_player)) if(is_win)
    is_win
  end

  attr_reader :players

end

class WinEvent
  def initialize(winner)
    @winner = winner
  end
  attr_reader :winner
end