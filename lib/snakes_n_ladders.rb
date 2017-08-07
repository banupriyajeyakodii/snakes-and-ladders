require 'observer'
class SnakesNLadders
  include Observable

  def initialize(dice, first_player, second_player, transporters = {}, state = nil)
    @players = [first_player, second_player]
    if(state.nil?)
      @player_positions = {first_player => Game::Position::NONE, second_player => Game::Position::NONE }
      @current_player = first_player
    else
      @player_positions = {first_player => state[first_player], second_player => state[second_player], :current_player => current_player}
      @current_player = state[:current_player]
    end
    @transporters = transporters
    @dice = dice

  end

  attr_reader :current_player, :dice

  def play
    outcome = dice.roll
    if (position_of(current_player) > Game::Position::NONE)
      next_position = @player_positions[current_player].add(outcome)
      move(current_player, next_position) 
    else  
      move(current_player, Game::Position::FIRST) if(outcome == 1)
    end
    transport(current_player)
    if(win?(current_player))
      changed
      notify_observers(:win, current_player)
    end
    change_player() if(outcome != 6)
  end

  def win?(player)
    position_of(current_player) == Game::Position::WIN
  end

  def transport(player)
    source_position = position_of(player)
    transport_destination = @transporters[source_position]
    if(transport_destination)
      event_type = source_position > transport_destination ? :chute : :ladder
      changed
      notify_observers(event_type, current_player, source_position, transport_destination)
      move(player, transport_destination)
    end
  end

  def position_of(player)
    @player_positions[player]
  end

  private
  def change_player
    @current_player = current_player == players[0] ? players[1] : players[0]
  end

  def move(player, position)
    @player_positions[player] = position
  end
  attr_reader :players
end