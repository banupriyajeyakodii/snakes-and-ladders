require_relative './position'
class SnakesLadders
  attr_accessor :player_token, :board, :outcome, :origin, :wormhole, :position
  attr_reader :snakes, :ladders, :snakes_and_ladders
  def initialize(*player_token)
    @token    = player_token
    @board    = Array.new(10){ Array.new(10){|x| x = []}}
    @player   = token[0]
    @wormhole = get_snakes_and_ladders
    @origin   = @board[0][0]
    @position = Position.new(0,0)
    @outcome  = Dice.new.outcome
    @board_status   = Hash.new
  end

  def play
    if(not is_in_board?(player))
      if(outcome == 1)
        position.of(1) << player
        board_status[player] = 1
        change_player
      else
        change_player
      end
    else
      if(outcome == 6)
        next_position << player
        set_board_status(next_position)
        if(next_position.has_wormhole?)
          new_position << player
          set_board_status(new_position)
        end
      else
        next_position << player
        set_board_status(next_position)
        if(next_position.has_wormhole?)
          new_position << player
          set_board_status(new_position)
        change_player
      end
    end
  end


  def get_snakes_and_ladders
    pattern = [[53, 19], [69, 33], [98, 5], [50, 12], [76, 24], [89, 63], [8, 57], [29, 35], [43, 77], [13, 45], [52, 94], [66, 86]]
    Hash[pattern.map { |e| [get_position(e[0]), get_position(e[1])] }]
  end

  def get_position(i)
    Position.new(position.of(i).x, position.of(i).y)
  end

  def is_in_board?(player)
    @board.flatten.include?(player)        
  end

  def next_position
    position.of(cell_number) + outcome
  end

  def new_position
    wormhole[next_position]
  end

  def set_board_status(position)
    board_status[player] = index_of(next_position)
  end

  def index_of(position)
    new_index = (position.x * 10) + position.y + 1
  end

  def cell_number
    board_status[player]
  end
  def change_player
    size = token.size
    i = token.index(player)
    nxt = (i + 1) % size 
    token[nxt]
  end


# if(Status.new(player).in_board?)




























  # def enter(token)
  #   unless (@board.flatten.include?(token))
  #     if(@outcome == 1)
  #       @origin << token
  #       @current_position = @origin
  #       check = 1
  #     else
  #       check = -1
  #     end
  #   else
  #       check = 0
  #   end
  # end

  # def listener (&observer)
  #   @observer = observer
  # end

  # def move(token, count, position)
  #   starting = @snakes_and_ladders.keys; ending = @snakes_and_ladders.values
  
    # current_position = Position.new(position.x, position.y)
    # token_at(position).delete_if{|t| t == token }
  
    # destination = current_position +(count)
    
  #   if(starting.any?{|l| [l.x, l.y] == [destination.x, destination.y]})
  #     destination = @snakes_and_ladders.select {|k,v| [k.x, k.y] == [destination.x, destination.y] }.values[0]
  #   end

  #   @board[destination.x][destination.y] << token
  #   @observer.call(WinEvent.new(token)) if(@board[9][9].include?(token))
  #   raise "#{token} takes another turn." if(count == 6)
  #   true
  # end

  # def token_at(position)
  #   @board[position.x][position.y]
  # end

end
# class WinEvent
#   def initialize(winner)
#     @winner = winner
#   end
#   attr_reader :winner
# end