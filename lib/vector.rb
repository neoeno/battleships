class Vector
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  attr_reader :x, :y

  def +(vector)
    Vector.new(x: x + vector.x, y: y + vector.y)
  end

  def ==(vector)
    @x == vector.x && @y == vector.y
  end
end
