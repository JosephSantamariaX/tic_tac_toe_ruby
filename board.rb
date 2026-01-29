# board.rb
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  def display
    puts "\n   1   2   3"
    @grid.each_with_index do |row, i|
      row_display = row.map { |cell| cell || " " }.join(" | ")
      puts "#{i + 1}  #{row_display}"
      puts "  ---+---+---" unless i == 2
    end
    puts
  end

  def valid_move?(row, col)
    in_bounds = row.between?(0, 2) && col.between?(0, 2)
    in_bounds && @grid[row][col].nil?
  end

  def place_symbol(row, col, symbol)
    return false unless valid_move?(row, col)

    @grid[row][col] = symbol
    true
  end

  def full?
    @grid.flatten.none?(&:nil?)
  end

  def winner?
    lines = []

    # rows and columns
    3.times do |i|
      lines << @grid[i] # row
      lines << [@grid[0][i], @grid[1][i], @grid[2][i]] # column
    end

    # diagonals
    lines << [@grid[0][0], @grid[1][1], @grid[2][2]]
    lines << [@grid[0][2], @grid[1][1], @grid[2][0]]

    lines.each do |line|
      return line[0] if line[0] && line.uniq.length == 1
    end

    nil
  end

  def game_over?
    winner? || full?
  end
end
