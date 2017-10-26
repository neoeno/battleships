class VerticalSequence
  def self.transform(size)
    size.times.map do |i|
      Vector.new(x: 0, y: i)
    end
  end
end
