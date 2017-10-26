class Board
  def initialize(size:)
    @size = size
    @cells = []
  end

  def set(x:, y:, to:)
    @cells << Cell.new(x: x, y: y, value: to)
  end

  def print
    rows.map do |row|
      row.map(&:value).join
    end.join("\n")
  end

  private

  def rows
    all_cells.each_slice(@size)
  end

  def all_cells
    all_coordinates.map do |x, y|
      get_cell(x: x, y: y)
    end
  end

  def all_coordinates
    @size.times.reduce([]) do |acc, y|
      @size.times.reduce(acc) do |acc, x|
        [*acc, [x, y]]
      end
    end
  end

  def get_cell(x:, y:)
    blank_cell = Cell.new(x: x, y: y, value: ".")
    @cells.find do |cell|
      cell.at?(x: x, y: y)
    end || blank_cell
  end

  class Cell
    def initialize(x:, y:, value:)
      @x = x
      @y = y
      @value = value
    end

    def at?(x:, y:)
      @x == x && @y == y
    end

    def value
      @value
    end
  end
end
