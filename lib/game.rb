require_relative './board'
require_relative './board_state_printer'
require_relative './vector'
require_relative './horizontal_sequence'
require_relative './vertical_sequence'
require_relative './ship'

class Game

  def initialize
    @board = Board.new(size: 10)
    @ships = []
    @available_ship_sizes = [5, 4, 3, 3, 2]
  end

  def print_board
    board_state_printer = BoardStatePrinter.new(board: @board, ships: @ships)
    board_state_printer.print
  end

  def place_ship(size:, top_left:, sequence:)
    return :fail unless @available_ship_sizes.include? size
    ship = Ship.new(size: size, top_left: top_left, sequence: sequence)
    return :fail if invalid_placement?(ship)
    @available_ship_sizes.delete_at(@available_ship_sizes.index(size))
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
    return :fail unless ship_within_board?(ship)
    return :fail if ship_overlaps_with_other_ships?(ship)
  end

  def ship_within_board?(ship)
    ship.segments.all? do |segment|
      @board.valid_position?(segment)
    end
  end

  def ship_overlaps_with_other_ships?(ship)
    ship.segments.any? do |segment|
      @ships.any? do |ship|
        ship.at?(segment)
      end
    end
  end
end
