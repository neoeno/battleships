require_relative '../lib/board_state_printer'
require_relative '../lib/vector'
require_relative '../lib/ship'
require_relative '../lib/horizontal_sequence'
require_relative '../lib/vertical_sequence'

RSpec.describe BoardStatePrinter do
  let(:board) { Board.new(size: 3) }

  it "can print a board" do
    board_state_printer = BoardStatePrinter.new(board: board, ships: [])
    expect(board_state_printer.print).to eq(
      "...\n" +
      "...\n" +
      "..."
    )
  end

  it "can add a ship" do
    board_state_printer = BoardStatePrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 0, y: 0), sequence: HorizontalSequence)
    ])
    expect(board_state_printer.print).to eq(
      "SSS\n" +
      "...\n" +
      "..."
    )
  end

  it "can add a ship in the middle" do
    board_state_printer = BoardStatePrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 0, y: 1), sequence: HorizontalSequence)
    ])
    expect(board_state_printer.print).to eq(
      "...\n" +
      "SSS\n" +
      "..."
    )
  end

  it "can add a ship vertically" do
    board_state_printer = BoardStatePrinter.new(board: board, ships: [
      Ship.new(size: 3, top_left: Vector.new(x: 2, y: 0), sequence: VerticalSequence)
    ])
    expect(board_state_printer.print).to eq(
      "..S\n" +
      "..S\n" +
      "..S"
    )
  end
end
