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

    # @snakes = {Position.new(5,2) => Position.new(1,8),
    #           Position.new(6,8) => Position.new(3,2),
    #           Position.new(9,7) => Position.new(0,4),
    #           Position.new(4,9) => Position.new(1,2),
    #           Position.new(7,5) => Position.new(2,3),
    #           Position.new(8,8) => Position.new(6,2)
    #           }.to_a
    #           p @snakes

# p Position.new(1, 1) Position.new(1, 1)
# class TTime
#   def initialize(hour, minute)
#     @hour = hour
#     @minutes = minute
#   end


#   def +(delta)
#     tminutes = @minutes + delta
#     @hour = @hour + tminutes / 60
#     @minutes = tminutes % 60
#     self
#   end

#   def to_s
#     "The average is %02d:%02d" % [hour, minutes]
#   end

#   attr_reader :hour, :minutes
# end
