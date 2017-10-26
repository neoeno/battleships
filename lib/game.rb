require_relative './board'
require_relative './vector'

class Game
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

  class Ship
    def initialize(vectors)
      @vectors = vectors
    end

    def fire(x:, y:)
      vector = @vectors.find do |vector|
        vector.x == x && vector.y == y
      end
      return :miss unless vector
      @vectors.delete(vector)
      return :sunk if @vectors.empty?
      return :hit
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
    ship_vectors = []
    top_left = Vector.new(x: x, y: y)
    sequence.transform(size).each do |offset|
      vector = top_left + offset
      ship_vectors << vector
      @board.set(vector: vector, to: "S")
    end
    @ships << Ship.new(ship_vectors)
  end

  def fire(x:, y:)
    @ships.reduce(:miss) do |status, ship|
      next status unless status == :miss
      ship.fire(x: x, y: y)
    end
  end

  def invalid_placement?(size:, x:, y:, sequence:)
    top_left = Vector.new(x: x, y: y)
    sequence.transform(size).any? do |offset|
      vector = top_left + offset
      !@board.valid_position?(vector)
    end
  end
end
