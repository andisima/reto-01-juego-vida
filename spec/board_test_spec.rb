require './board'
RSpec.describe "Board" do
  let(:board) { Board.new }
  describe "#build" do
    it "Creates the board of the game" do
    board.build
    expect(board.build).to be_kind_of(Array)
    end
  end

  describe "#read" do
    it "Will read the board" do
      new_board = [
        [1,1,0,1],
        [1,1,0,1],
        [1,1,0,0],
        [0,0,0,0]
      ]
      expected_board = board.read
      expect(expected_board).to eq(new_board)
    end
  end
end
