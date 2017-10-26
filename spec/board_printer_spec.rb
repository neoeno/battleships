require_relative '../lib/board_printer'
require_relative '../lib/vector'
require_relative '../lib/ship'
require_relative '../lib/horizontal_sequence'
require_relative '../lib/vertical_sequence'

RSpec.describe BoardPrinter do
  let(:board) { Board.new(size: 3) }

  it "can print a board" do
    board_printer = BoardPrinter.new(board: board, ships: [])
    expect(board_printer.print).to eq(
      "...\n" +
      "...\n" +
      "..."
    )
  end

  it "can add a ship" do
    board_printer = BoardPrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 0, y: 0), sequence: HorizontalSequence)
    ])
    expect(board_printer.print).to eq(
      "SSS\n" +
      "...\n" +
      "..."
    )
  end

  it "can add a ship in the middle" do
    board_printer = BoardPrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 0, y: 1), sequence: HorizontalSequence)
    ])
    expect(board_printer.print).to eq(
      "...\n" +
      "SSS\n" +
      "..."
    )
  end

  it "can add a ship vertically" do
    board_printer = BoardPrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 2, y: 0), sequence: VerticalSequence)
    ])
    expect(board_printer.print).to eq(
      "..S\n" +
      "..S\n" +
      "..S"
    )
  end

  it "tells you whether cells are what you think" do
    board_printer = BoardPrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 0, y: 1), sequence: HorizontalSequence)
    ])
    expect(board_printer.cell_is?(vector: Vector.new(x: 1, y: 1), value: "S")).to eq true
  end
end
