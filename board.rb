require_relative 'tile'
require 'byebug'
class Board
  attr_accessor :grid

  SIZE = 9
  def initialize
    @grid = Array.new(SIZE){Array.new(SIZE)}

  end

  def populate
    self.grid.each_with_index do |row, idy|
      row.each_with_index do |col, idx|
        self.grid[idy][idx] = Tile.new(self, [idx,idy])
      end
    end
  #  self.grid[0][0] = Tile.new(self, [0,0])
    self.grid
  end

  def seed_bombs
  end

  def render

    @grid.each do |row|
      row.each {|col| print ( "| #{col.val} ")}
      print "|"
      print "\n"
       print "-------------------------------------"
      print "\n"
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  board.render

end
