require_relative './board'
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
    @board.print
  end

  def place_ship(size:, top_left:, sequence:)
    return :fail if invalid_placement?(size: size, top_left: top_left, sequence: sequence)
    @ships << Ship.new(size: size, top_left: top_left, sequence: sequence)
    @ships.last.segments.each do |vector|
      @board.set(vector: vector, to: "S")
    end
  end

  def fire(vector)
    @ships.reduce(:miss) do |status, ship|
      next status unless status == :miss
      ship.fire(vector)
    end
  end

  def invalid_placement?(size:, top_left:, sequence:)
    sequence.transform(size).any? do |offset|
      !@board.valid_position?(top_left + offset)
    end
  end
end
