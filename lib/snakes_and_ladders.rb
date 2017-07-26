class SnakesLadders
  attr_accessor :token1, :token2, :board, :outcome
  attr_reader :snakes, :ladders
  def initialize(token1, token2)
    @token1 = token1
    @token2 = token2
    @outcome = outcome
    @board = Array.new(10){ Array.new(10){|x| x = []}}
    @snakes_and_ladders = {
              Position.new(5,2) => Position.new(1,8), Position.new(6,8) => Position.new(3,2), Position.new(9,7) => Position.new(0,4), 
              Position.new(4,9) => Position.new(1,2), Position.new(7,5) => Position.new(2,3), Position.new(8,8) => Position.new(6,2),
              Position.new(0,7) => Position.new(5,1), Position.new(2,8) => Position.new(3,2), Position.new(4,2) => Position.new(7,6),
              Position.new(1,2) => Position.new(4,4), Position.new(5,1) => Position.new(9,3), Position.new(6,5) => Position.new(8,5) }
  end
  
  def roll_dice
    @outcome = 1 + rand(6)
  end

  def enter(position, token)
    unless (@board.flatten.include?(token))
      @board[position.x][position.y] << token  if(@outcome == 1)
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
