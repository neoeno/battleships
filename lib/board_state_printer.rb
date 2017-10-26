require_relative './vector'

class BoardStatePrinter
  def initialize(board:, ships:)
    @board = board
    @ships = ships
  end

  def print
    rows.map do |cells|
      cells.join
    end.join("\n")
  end

  def cell_is?(vector:, value:)
    get_cell(vector) == value
  end

  private

  def rows
    all_cells.each_slice(@board.size)
  end

  def all_cells
    @board.all_vectors.map do |vector|
      get_cell(vector)
    end
  end

  def get_cell(vector)
    has_ship = @ships.any? do |ship|
      ship.at?(vector)
    end
    return "S" if has_ship
    "."
  end
end
