class Position
  def initialize(x, y)
    @x = x
    @y = y
    @game = SnakesLadders.new([])
  end

  def of(number)      # => factory method
    @x = number / 10
    @y = (number % 10) - 1
    self
  end

  def +(steps)
    move = @y + steps
    @x = @x + move / 10
    @y = move % 10
    self
  end

  def has_wormhole?
    game.wormhole.has_key?(self)
  end

  attr_reader :x, :y
end
