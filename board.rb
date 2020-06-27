

class Board
  def initialize
    @size = 4
    @board = [
    [1,1,1,1],
    [0,1,0,1],
    [0,0,0,0],
    [1,1,0,1]
  ]
  end

  def build
    @size = 4
    @board = [
    [1,1,1,1],
    [0,1,0,1],
    [0,0,0,0],
    [1,1,0,1]
  ]
  end

  def read
    temp_board = Marshal.load(Marshal.dump(@board))
    (0..3).each do |row|
      (0..3).each do |column|
        status = status(row, column)
        alive_neighbours = neighbours(row,column)
        if status && alive_neighbours >=4
          temp_board[row][column] = 0
        elsif status && alive_neighbours >=2
          temp_board[row][column] = 1
        elsif status && alive_neighbours <=1
          temp_board[row][column] = 0
        elsif !status && alive_neighbours == 3
          temp_board[row][column] = 1
        end
      end
    end
    @board = temp_board
    @board
  end

  def status(row, column)
    @board[row][column] == 1 ? true : false
  end
  def neighbours(row, column)
    neighbours = []
    neighbours.push(@board[row-1][column]) if inside_board?(row-1, column)
    neighbours.push(@board[row-1][column+1]) if inside_board?(row-1, column+1)
    neighbours.push(@board[row][column+1]) if inside_board?(row, column+1)
    neighbours.push(@board[row+1][column+1]) if inside_board?(row+1, column+1)
    neighbours.push(@board[row+1][column]) if inside_board?(row+1, column)
    neighbours.push(@board[row+1][column-1]) if inside_board?(row+1, column-1)
    neighbours.push(@board[row][column-1]) if inside_board?(row, column-1)
    neighbours.push(@board[row-1][column-1]) if inside_board?(row-1, column-1)
    neighbours.count(1)
  end

  def inside_board?(row, column)
    row < @size && row >= 0 && column < @size && column >= 0
  end

  def print_board
    # Esto nos ayuda para hacer la matrix en cuadrito
    @board.to_a.each {|r| puts r.inspect}
  end

end
board = Board.new
# board.print_board
board.read
board.print_board
# puts "= "*30
# board.print_board
