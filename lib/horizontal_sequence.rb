class HorizontalSequence
  def self.transform(size)
    size.times.map do |i|
      Vector.new(x: i, y: 0)
    end
  end
end
