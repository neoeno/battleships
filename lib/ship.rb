require 'set'

class Ship
  def initialize(size:, top_left:, sequence:)
    @size = size
    @top_left = top_left
    @sequence = sequence
    @bombed = Set.new
  end

  def fire(firing_vector)
    hit_segment = segments.find do |segment|
      segment == firing_vector
    end
    return :miss unless hit_segment
    @bombed << hit_segment
    return :sunk if @bombed.length == segments.length
    return :hit
  end

  def segments
    @sequence.transform(@size).map do |offset|
      @top_left + offset
    end
  end

  def at?(position)
    segments.any? do |segment|
      segment == position
    end
  end
end
