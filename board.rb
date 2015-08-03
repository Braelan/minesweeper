require_relative 'tile'

class Board
  attr_accessor :grid

  SIZE = 9
  def initialize
    @grid = Array.new(SIZE){Array.new(SIZE)}

  end

  def fill_with_tiles
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

  def print
  end


end
