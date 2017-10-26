require_relative './board'
require_relative './board_printer'
require_relative './vector'
require_relative './horizontal_sequence'
require_relative './vertical_sequence'
require_relative './ship'

class Game
  def initialize
    @board = Board.new(size: 10)
    @ships = []
  end

  def print_board
    board_printer = BoardPrinter.new(board: @board, ships: @ships)
    board_printer.print
  end

  def place_ship(size:, top_left:, sequence:)
    ship = Ship.new(size: size, top_left: top_left, sequence: sequence)
    return :fail if invalid_placement?(ship)
    @ships << ship
  end

  def fire(vector)
    @ships.reduce(:miss) do |status, ship|
      next status unless status == :miss
      ship.fire(vector)
    end
  end

  private

  def invalid_placement?(ship)
    return :fail unless ship.segments.all? do |segment|
      @board.valid_position?(segment)
    end
  end
end
