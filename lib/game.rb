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
      @ship_vectors = vectors
    end

    def fire(firing_vector)
      hit_ship_vector = @ship_vectors.find do |ship_vector|
        ship_vector == firing_vector
      end
      return :miss unless hit_ship_vector
      @ship_vectors.delete(hit_ship_vector)
      return :sunk if @ship_vectors.empty?
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

  def place_ship(size:, top_left:, sequence:)
    return :fail if invalid_placement?(size: size, top_left: top_left, sequence: sequence)
    ship_vectors = []
    sequence.transform(size).each do |offset|
      vector = top_left + offset
      ship_vectors << vector
      @board.set(vector: vector, to: "S")
    end
    @ships << Ship.new(ship_vectors)
  end

  def fire(vector)
    @ships.reduce(:miss) do |status, ship|
      next status unless status == :miss
      ship.fire(vector)
    end
  end

  def invalid_placement?(size:, top_left:, sequence:)
    sequence.transform(size).any? do |offset|
      vector = top_left + offset
      !@board.valid_position?(vector)
    end
  end
end
