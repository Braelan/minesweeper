require_relative 'board.rb'
require_relative 'tile.rb'

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


  end


end
