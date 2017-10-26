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
    game.place_ship(size: 1, x: 0, y: 0, orientation: :horizontal)
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
    game.place_ship(size: 1, x: 0, y: 1, orientation: :horizontal)
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
    game.place_ship(size: 3, x: 0, y: 0, orientation: :horizontal)
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
    game.place_ship(size: 3, x: 0, y: 0, orientation: :vertical)
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
end
