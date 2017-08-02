class Status
  def initialize(player)
    @player = player
  end
  def save
    @state = nil
  end 
  def in_board?
    SnakesLadders.new.board.flatten.include?(player)
  end
end

if(Status.new(player).in_board?)