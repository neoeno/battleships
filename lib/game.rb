class Game
  def initialize
    @board = (("." * 10) + "\n") * 10
  end

  def print_board
    @board
  end

  def place_ship(size:, x:, y:)
    top_left = y * 10 + x
    @board[top_left...size] = "S" * size
  end
end
