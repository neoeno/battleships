class Board
  def initialize(size:)
    @size = size
  end

  attr_reader :size

  def valid_position?(vector)
    valid_range = (0...@size)
    valid_range.cover?(vector.x) && valid_range.cover?(vector.y)
  end

  def all_vectors
    @size.times.reduce([]) do |acc, y|
      @size.times.reduce(acc) do |acc, x|
        [*acc, Vector.new(x: x, y: y)]
      end
    end
  end
end
