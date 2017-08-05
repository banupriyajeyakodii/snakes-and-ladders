require 'byebug'
# require_relative '/home/robin/git/snakes-and-ladders/lib/snakesladders.rb'
module Game
  class Position
    attr_reader :x, :y
    def initialize(x, y)
      @x = x
      @y = y
    end

    def ==(position)
      (@x == position.x && @y == position.y)
    end

    def self.of(number)
      Position.new(number / 10, number % 10)
    end

    def add(delta)
      aggregate = number + delta
      Position.of(aggregate)
    end


    def number
      x * 10 + y
    end

    def >(another)
      self.number > another.number
    end

    # def has_snakes_or_ladders?
    #   SnakesNLadders.snakes_and_ladders.keys.any?{ |source| of(source) == self }
    # end

    NONE = Position.new(0, 0)


  end
end
