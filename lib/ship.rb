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
