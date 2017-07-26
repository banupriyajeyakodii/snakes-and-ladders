class Console
  def initialize
    @game = SnakesLadders.new(:X, :O)
    @winner = false
    @game.listener { |event|
      print_board
      if(event.is_a?(WinEvent))
        puts "Player #{event.winner} has won!"
        @winner = event.winner
      end
    }
  end
end

def 