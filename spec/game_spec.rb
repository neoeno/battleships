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
end
