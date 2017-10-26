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
  end

  def print_board
    @board.print
  end

  def place_ship(size:, x:, y:, sequence:)
    return :fail if invalid_placement?(size: size, x: x, y: y, sequence: sequence)
    sequence.transform(size).each do |vector|
      @board.set(x: x + vector.x, y: y + vector.y, to: "S")
    end
  end

  private

  def invalid_placement?(size:, x:, y:, sequence:)
    sequence.transform(size).any? do |vector|
      !@board.valid_position?(x: x + vector.x, y: y + vector.y)
    end
  end
end
