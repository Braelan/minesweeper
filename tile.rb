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
    @val = " "
  end

  def val
    @val
  end

  def val=(newval)
    @val = newval
  end


  def status_update
    if self.revealed?
      if self.bombed?
        @val = "B"
      else
        @val = "#{self.neighbor_bomb_count}"
      end
    else
      if self.flagged?
        @val = "?"
      else
        @val = " "
      end
    end

  end

  def status_update_dev
    # if self.revealed?
      if self.bombed?
        @val = "B"
      else
        @val = "#{self.neighbor_bomb_count}"
      end
    # else
      if self.flagged?
        @val = "?"
      # else
      #   @val = " "
      end
    # end

  end

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
    deltas.each do |y|  #0 is the first row e grid[0]
        deltas.each do |x|
          x_offset, y_offset = x + pos[0], y + pos[1]
          if onboard?(x_offset, y_offset)
            neighbor_array <<  self.board.grid[y_offset][x_offset]
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
    count = 0
    self.neighbors.each{|neighbor| count += 1 if neighbor.bombed?}
    count
  end

  def inspect
    "#{pos}, #{val}"
  end

  # def print
  #
  # end

end
