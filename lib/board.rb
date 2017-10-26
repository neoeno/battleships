require_relative './vector'

class Board
  def initialize(size:)
    @size = size
    @cells = []
  end

  def set(vector:, to:)
    @cells << Cell.new(vector: vector, value: to)
  end

  def print
    rows.map do |cells|
      cells.map(&:value).join
    end.join("\n")
  end

  def valid_position?(vector)
    valid_range = (0...@size)
    valid_range.cover?(vector.x) && valid_range.cover?(vector.y)
  end

  def cell_is?(vector:, value:)
    get_cell(vector).value == value
  end

  private

  def rows
    all_cells.each_slice(@size)
  end

  def all_cells
    all_coordinates.map do |vector|
      get_cell(vector)
    end
  end

  def all_coordinates
    @size.times.reduce([]) do |acc, y|
      @size.times.reduce(acc) do |acc, x|
        [*acc, Vector.new(x: x, y: y)]
      end
    end
  end

  def get_cell(vector)
    blank_cell = Cell.new(vector: vector, value: ".")
    @cells.find do |cell|
      cell.at?(vector)
    end || blank_cell
  end

  class Cell
    def initialize(vector:, value:)
      @vector = vector
      @value = value
    end

    def at?(vector)
      @vector.x == vector.x && @vector.y == vector.y
    end

    def value
      @value
    end
  end
end
