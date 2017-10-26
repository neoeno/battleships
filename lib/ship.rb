require 'set'

class Ship
  def initialize(size:, top_left:, sequence:)
    @size = size
    @top_left = top_left
    @sequence = sequence
    @bombed = Set.new
  end

  def fire(firing_vector)
    return :miss unless at?(firing_vector)
    @bombed << firing_vector
    return :sunk if @bombed.length == segments.length
    return :hit
  end

  def segments
    @sequence.transform(@size).map do |offset|
      @top_left + offset
    end
  end

  def at?(position)
    segments.include?(position)
  end
end
