require_relative './board'

class Game
  class Vector
    def initialize(x:, y:)
      @x = x
      @y = y
    end

    attr_reader :x, :y
  end

  class VerticalSequence
    def self.transform(size)
      size.times.map do |i|
        Vector.new(x: 0, y: i)
      end
    end
  end

  class HorizontalSequence
    def self.transform(size)
      size.times.map do |i|
        Vector.new(x: i, y: 0)
      end
    end
  end

  def initialize
    @board = Board.new(size: 10)
    @ships = []
  end

  def print_board
    @board.print
  end

  def place_ship(size:, x:, y:, sequence:)
    return :fail if invalid_placement?(size: size, x: x, y: y, sequence: sequence)
    ship_cells = []
    sequence.transform(size).each do |vector|
      ship_cells << [x + vector.x, y + vector.y]
      @board.set(x: x + vector.x, y: y + vector.y, to: "S")
    end
    @ships << ship_cells
  end

  def fire(x:, y:)
    if @board.cell_is?(x: x, y: y, value: "S")
      return :sunk if fire_sinks_battleship?(x: x, y: y)
      return :hit
    end
    return :miss
  end

  private

  def fire_sinks_battleship?(x:, y:)
    @ships.each do |ship_coords|
      ship_coords.reject! do |coord|
        coord[0] == x && coord[1] == y
      end
    end
    return false unless @ships.find(&:empty?)
    @ships.reject!(&:empty?)
    return true
  end

  def invalid_placement?(size:, x:, y:, sequence:)
    sequence.transform(size).any? do |vector|
      !@board.valid_position?(x: x + vector.x, y: y + vector.y)
    end
  end
end
