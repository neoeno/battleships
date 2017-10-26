require_relative '../lib/game'

RSpec.describe Game do
  it "shows a board" do
    game = Game.new
    board = game.print_board
    expect(board).to eq(
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "places a 1x1 ship" do
    game = Game.new
    game.place_ship(size: 1, x: 0, y: 0, sequence: Game::HorizontalSequence)
    board = game.print_board
    expect(board).to eq(
      "S.........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "places a 1x1 ship offset by 1 row" do
    game = Game.new
    game.place_ship(size: 1, x: 0, y: 1, sequence: Game::HorizontalSequence)
    board = game.print_board
    expect(board).to eq(
      "..........\n" +
      "S.........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "places a 1x3 ship horizontally" do
    game = Game.new
    game.place_ship(size: 3, x: 0, y: 0, sequence: Game::HorizontalSequence)
    board = game.print_board
    expect(board).to eq(
      "SSS.......\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "places a 1x3 ship vertically" do
    game = Game.new
    game.place_ship(size: 3, x: 0, y: 0, sequence: Game::VerticalSequence)
    board = game.print_board
    expect(board).to eq(
      "S.........\n" +
      "S.........\n" +
      "S.........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "forbids ship placement off the edges of the board" do
    game = Game.new
    placement_status = game.place_ship(size: 3, x: 0, y: 9, sequence: Game::VerticalSequence)
    board = game.print_board
    expect(placement_status).to eq :fail
    expect(board).to eq(
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      "..........\n" +
      ".........."
    )
  end

  it "lets you know whether your missiles hit" do
    game = Game.new
    game.place_ship(size: 3, x: 0, y: 0, sequence: Game::VerticalSequence)
    result = game.fire(x: 0, y: 1)
    expect(result).to eq :hit
  end

  it "lets you know whether your missiles miss" do
    game = Game.new
    game.place_ship(size: 3, x: 0, y: 0, sequence: Game::VerticalSequence)
    result = game.fire(x: 0, y: 3)
    expect(result).to eq :miss
  end
end
