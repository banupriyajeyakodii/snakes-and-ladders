class SnakesLadders
  attr_accessor :player_token, :board, :outcome, :origin
  attr_reader :snakes, :ladders, :snakes_and_ladders
  def initialize(*player_token)
    @player_token = player_token
    @outcome = outcome
    @board = Array.new(10){ Array.new(10){|x| x = []}}
    @origin = @board[0][0]
    @current_position = nil
    @snakes_and_ladders = {
              Position.new(5,2) => Position.new(1,8), Position.new(6,8) => Position.new(3,2), Position.new(9,7) => Position.new(0,4), 
              Position.new(4,9) => Position.new(1,1), Position.new(7,5) => Position.new(2,3), Position.new(8,8) => Position.new(6,2),
              Position.new(0,7) => Position.new(5,6), Position.new(2,8) => Position.new(3,4), Position.new(4,2) => Position.new(7,6),
              Position.new(1,2) => Position.new(4,4), Position.new(5,1) => Position.new(9,3), Position.new(6,5) => Position.new(8,5) }
  end
  

  def make_wormhole

  end
            

  
  # def roll_dice
  #   @outcome = rand(1..6)
  # end

  def enter(token)
    unless (@board.flatten.include?(token))
      if(@outcome == 1)
        @origin << token
        @current_position = @origin
        check = 1
      else
        check = -1
      end
    else
        check = 0
    end
  end

  def listener (&observer)
    @observer = observer
  end

  def move(token, count, position)
    starting = @snakes_and_ladders.keys; ending = @snakes_and_ladders.values
    current_position = Position.new(position.x, position.y)
    token_at(position).delete_if{|t| t == token }
    destination = current_position +(count)
    
    if(starting.any?{|l| [l.x, l.y] == [destination.x, destination.y]})
      destination = @snakes_and_ladders.select {|k,v| [k.x, k.y] == [destination.x, destination.y] }.values[0]
    end

    @board[destination.x][destination.y] << token
    @observer.call(WinEvent.new(token)) if(@board[9][9].include?(token))
    raise "#{token} takes another turn." if(count == 6)
    true
  end

  def token_at(position)
    @board[position.x][position.y]
  end

end
class WinEvent
  def initialize(winner)
    @winner = winner
  end
  attr_reader :winner
end