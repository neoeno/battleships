require_relative './board'

class Game
  def initialize
    @board = Board.new(size: 10)
  end

  def print_board
    @board.print
  end

  def place_ship(size:, x:, y:, orientation:)
    if orientation == :vertical
      size.times do |i|
        @board.set(x: x, y: y + i, to: "S")
      end
    else
      size.times do |i|
        @board.set(x: x + i, y: y, to: "S")
      end
    end
  end
end
