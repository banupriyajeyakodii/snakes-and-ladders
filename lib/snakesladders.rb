# require 'byebug'
# require_relative '/home/robin/git/snakes-and-ladders/lib/position.rb'
module Game
  class SnakesLadders
    attr_accessor :token, :board, :outcome, :origin, :player, :board_status
    attr_reader :wormhole
    def initialize(*token)
      @token = token
      @board = Array.new(10){ Array.new(10){|x| x = []}}
      @player = token[0]
      @wormhole = get_snakes_and_ladders
      @origin = @board[0][0]
      @outcome = Dice.new.outcome
      @board_status = Hash.new
    end
 
    def play
      if(not is_in_board?)
        if(outcome == 1)
          position.of(1) << player
          board_status[player] = 1
          change_player
        else
          change_player
          return "Try next turn!"
        end
      else
        if(outcome == 6)
          respond
          if(next_position.has_wormhole?)
            respond
            return "Take another turn!"
          end
        else
          respond
          if(next_position.has_wormhole?)
            respond
            change_player
          end
        end
      end
    end

    def respond
      remove_previous
      next_position << player
      set_board_status(next_position)
    end

    def get_snakes_and_ladders
      pattern = [[53, 19], [69, 33], [98, 5], [50, 12], [76, 24], [89, 63], [8, 57], [29, 35], [43, 77], [13, 45], [52, 94], [66, 86]]
      Hash[pattern.map { |e| [get_position(e[0]), get_position(e[1])] }]
    end

    def get_position(i)
      position = Game::Position.new(0,0)
      Position.new(position.of(i).x, position.of(i).y)
    end

    def is_in_board?
      @board.flatten.include?(player)        
    end

    def next_position
      position = Game::Position.new(0,0)
      position.of(cell_number) + outcome
    end

    def remove_previous
      position = Game::Position.new(0,0)
      token_at(position.of(cell_number)).delete_if{|token| token == player}
    end

    def new_position
      wormhole.select {|source, destination| source == next_position }.values[0]
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
    def token_at(position)
      @board[position.x][position.y] 
    end

  end
end











# class WinEvent
#   def initialize(winner)
#     @winner = winner
#   end
#   attr_reader :winner
# end


# p SnakesLadders.new([:X]).wormhole.has_key?(Position.new(0,0).of(53))
# (Position.new(0,0).of(53)).has_wormhole?
# p SnakesLadders.new([:X]).wormhole