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
    self.dup.grid.flatten.shuffle.take(SIZE).each{|el| el.bombed = true}
  end

  def update
    self.grid.each do |row|
      row.each{ |col| col.status_update}
    end
  end
  def render
     self.update
    @grid.each do |row|
      row.each {|col| print ( "| #{col.val} ")}
      print "|"
      print "\n"
       print "-------------------------------------"
      print "\n"
    end
  end

  def reveal_position(pos)  # recursive reveal
    tile = self.grid[pos[1]][pos[0]]
    tile.reveal
    if tile.val == "0"
      array = tile.neighbors  # [[0,0], [1, 0]]
      array.each {|square| self.reveal_position(square.pos)}
    end

  end


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  board.render

end
