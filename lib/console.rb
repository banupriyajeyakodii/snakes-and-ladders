Dir["#{Dir.pwd}/*"].each {|f| require f }
# require 'byebug'
class Console
attr_accessor :box, :game
attr_reader :winner
  def initialize
    @game = SnakesLadders.new(:X, :Y)
    @winner = false
    @empty_board = Array.new(10){Array.new(10){|x| x = [""]}}
    @current_board = game.board
    @initial_position  = game.origin
    @current_position = game.current_position
    @game.listener { |event|
      if(event.is_a?(WinEvent))
        puts "Player #{event.winner} has won!"
        @winner = event.winner
      end
    }
  end
  def completed
    @current_board[9][9].size != 1
  end

  def get_board(board)
    board = board.each_with_index.map{|e1,i1| e1.each_with_index.map{|e2,i2|  [(i1*10 + i2) +1, e2] }.to_h }
    board = board.reverse.each_with_index.map  { |e,i|  (i%2 == 0) ? e.to_a.reverse.to_h : e }
    board = (:a..:j).each_with_index.map{ |a, i| board.map{|h|  Hash[h.to_a[i][0] = a, h.to_a[i][1]] }}
    board = board.transpose.map { |arr| Hash[*arr.map(&:to_a).flatten(2)] }
  end

  def run
    current_token = :X
    while(not completed) do
      begin
        puts "Player 1 takes X. \n Player 2 takes Y.\n"
        puts "Player #{current_token}'s turn."
        puts "Press Enter to Roll Dice"
        input = gets.chomp
        raise "Press Enter..." if(input != "\n")
        puts "Dice is Rolling..."
        game.roll_dice
        puts "Dice Rolled for #{game.outcome}"
        game.enter(current_token) ? "" : game.move(current_token, game.outcome, current_position)
      end
    end
  end

end
Console.new.run