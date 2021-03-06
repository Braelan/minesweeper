require_relative 'board.rb'
require_relative 'tile.rb'
# require 'byebug'

class Game
  attr_accessor :board

  def initialize
    @board = self.setboard
  end

  def setboard
    board = Board.new
    board.populate
    board.seed_bombs
    board

  end

  def play
     until won?
    #debugger
      self.board.render
      pos, choice = get_input
      outcomes(pos, choice)
     end
     if won?
       puts "Congratulations! You won!"
     else
       puts "You lost!!"
     end
  end



  def won?
    return true if board.grid.all? do |rows|
      rows.all? do |tile|
        tile.revealed? || tile.bombed?
      end
    end
    false
  end

  def outcomes(pos, choice)
    case
    when choice == "f"
    when choice == "r"
      self.board.reveal_position(pos)
    when choice == "a"
    end
  end

  def get_input
    pos = [-1,-1] #start with an off board value to enter loop]
    until self.board.grid[0][0].onboard?(pos[0],pos[1])
      puts "Where do you want to play? x,y"
      pos = gets.chomp.split(",").map{ |el| el.to_i}
    end
    choices = ["f","r", "a"]
    choice = nil
    until choices.include?(choice)
    puts "What do you want to do?  (f)lag ,(r)eveal ,(a)ll"
    choice = gets.chomp
    end

    return pos, choice

  end


end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
