class Position
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(steps)
    move = @y + steps
    @x = @x + move / 10
    @y = move % 10
    self
  end

  attr_reader :x, :y
end