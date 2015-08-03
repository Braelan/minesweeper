require_relative 'board'

class Tile
  attr_accessor :bombed, :flagged, :revealed, :val, :pos, :board


  def initialize (board, pos)
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
    #position is in [x,y] form
    @pos = pos
    @val = "X"
  end

  def val
    @val
  end

  def val=(newval)
    @val = newval
  end

    # if self.bombed?
    #   @val = "O"
    # end

  def reveal
    self.revealed = true
  end

  def bombed?
    self.bombed
  end

  def flagged?
    self.flagged
  end

  def revealed?
    self.revealed
  end

  def neighbors
    neighbor_array = []
    deltas = [-1,0,1]
    deltas.each do |x|
        deltas.each do |y|
          x_offset, y_offset = x + pos[0], y + pos[1]
          if onboard?(x_offset, y_offset)
            neighbor_array <<  self.board.grid[x_offset][y_offset]
          end
        end
    end
    neighbor_array.delete(self)
    neighbor_array
  end

  def onboard?(arg1, arg2)
    [arg1,arg2].all?{|el| el.between?(0,8)}
  end

  def neighbor_bomb_count

  end

  def inspect
    "#{bombed?} #{pos}"
  end

  # def print
  #
  # end

end
