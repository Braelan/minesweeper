require_relative 'board'

class Tile
  attr_accessor :bombed, :flagged, :revealed


  def initialize (board, pos)
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
    #position is in [x,y] form
    @pos = pos

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
     board
  end

  def neighbor_bomb_count

  end

  def inspect
    "#{bombed}, #{flagged}, #{revealed}, #{pos}"
  end



end
