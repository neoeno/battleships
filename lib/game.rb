class Game
  def initialize
    @board = (("." * 10) + "\n") * 10
  end

  def print_board
    @board
  end

  def place_ship(size:, x:, y:, orientation:)
    top_left = y * 11 + x
    if orientation == :horizontal
      @board[top_left...top_left + size] = "S" * size
    else
      size.times do |i|
        @board[top_left + (i * 11)] = "S"
      end
    end
  end
end
