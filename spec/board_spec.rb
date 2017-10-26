require_relative '../lib/board'

RSpec.describe Board do
  it "reports invalid positions" do
    board = Board.new(size: 3)
    expect(board.valid_position?(Vector.new(x: 0, y: 0))).to eq true
    expect(board.valid_position?(Vector.new(x: 2, y: 0))).to eq true
    expect(board.valid_position?(Vector.new(x: 2, y: 2))).to eq true
    expect(board.valid_position?(Vector.new(x: 0, y: 2))).to eq true
    expect(board.valid_position?(Vector.new(x: 0, y: 3))).to eq false
    expect(board.valid_position?(Vector.new(x: 3, y: 0))).to eq false
    expect(board.valid_position?(Vector.new(x: 3, y: 3))).to eq false
    expect(board.valid_position?(Vector.new(x: -1, y: 0))).to eq false
  end

  it "provides all vectors" do
    board = Board.new(size: 2)
    expect(board.all_vectors).to eq [
      Vector.new(x: 0, y: 0),
      Vector.new(x: 1, y: 0),
      Vector.new(x: 0, y: 1),
      Vector.new(x: 1, y: 1),
    ]
  end
end
