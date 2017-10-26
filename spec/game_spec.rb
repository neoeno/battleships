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
      "..........\n"
    )
  end

  it "places a 1x1 ship" do
    game = Game.new
    game.place_ship(size: 1, x: 0, y: 0)
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
      "..........\n"
    )
  end

  it "places a 1x3 ship" do
    game = Game.new
    game.place_ship(size: 3, x: 0, y: 0)
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
      "..........\n"
    )
  end
end
