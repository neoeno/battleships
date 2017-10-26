require_relative '../lib/board'

RSpec.describe Board do
  it "can print a board" do
    board = Board.new(size: 3)
    expect(board.print).to eq(
      "...\n" +
      "...\n" +
      "..."
    )
  end

  it "can flip cells" do
    board = Board.new(size: 3)
    board.set(x: 0, y: 0, to: "S")
    expect(board.print).to eq(
      "S..\n" +
      "...\n" +
      "..."
    )
  end

  it "can flip cells in the middle" do
    board = Board.new(size: 3)
    board.set(x: 1, y: 1, to: "S")
    expect(board.print).to eq(
      "...\n" +
      ".S.\n" +
      "..."
    )
  end

  it "can flip cells off to one side" do
    board = Board.new(size: 3)
    board.set(x: 0, y: 1, to: "S")
    expect(board.print).to eq(
      "...\n" +
      "S..\n" +
      "..."
    )
  end

  it "reports invalid positions" do
    board = Board.new(size: 3)
    expect(board.valid_position?(x: 0, y: 0)).to eq true
    expect(board.valid_position?(x: 2, y: 0)).to eq true
    expect(board.valid_position?(x: 2, y: 2)).to eq true
    expect(board.valid_position?(x: 0, y: 2)).to eq true
    expect(board.valid_position?(x: 0, y: 3)).to eq false
    expect(board.valid_position?(x: 3, y: 0)).to eq false
    expect(board.valid_position?(x: 3, y: 3)).to eq false
    expect(board.valid_position?(x: -1, y: 0)).to eq false
  end

  it "tells you whether cells are what you think" do
    board = Board.new(size: 3)
    board.set(x: 1, y: 1, to: "S")
    expect(board.cell_is?(x: 1, y: 1, value: "S")).to eq true
  end
end
