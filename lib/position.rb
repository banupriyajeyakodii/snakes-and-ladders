module Game
  class Position
    attr_reader :x, :y
    def initialize(x, y)
      @x = x
      @y = y
    end

    def eql?(position)
      (@x == position.x && @y == position.y)
    end

    def ==(position)
      self.eql?(position)
    end

    def self.of(number)
      self.new(number / 10, number % 10)
    end

    def add(delta)
      aggregate = number + delta
      Position.of(aggregate)
    end

    def hash
      @x.hash
    end

    def number
      x * 10 + y
    end

    def >(another)
      self.number > another.number
    end

    NONE = Position.new(0, 0)

    FIRST = Position.new(0, 1)
    WIN = Position.new(10, 0)

  end
end
