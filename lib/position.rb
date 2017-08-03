require 'byebug'
require_relative '/home/robin/git/snakes-and-ladders/lib/snakesladders.rb'
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

    def has_wormhole?
      game = Game::SnakesLadders.new([:X])
      game.wormhole.keys.any? { |e| e == self}
    end

    def of(number)
      @x = number / 10
      @y = (number % 10) - 1
      self
    end

    def +(steps)
      move = @y + steps
      @x = @x + move / 10
      @y = move % 10
      Position.new(self.x, self.y)
    end


  end
end
