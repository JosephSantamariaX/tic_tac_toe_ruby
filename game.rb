require_relative 'board'
require_relative 'player'

class Game
  def initialize(player1, player2, board = Board.new)
    @players = [player1, player2]
    @board = board
    @current_index = 0
  end

  def play
    puts "Welcome to Tic-Tac-Toe in Ruby!"

    loop do
      system("clear") || system("cls")
      @board.display

      current_player = @players[@current_index]
      puts "#{current_player.name}'s turn (#{current_player.symbol})"

      row, col = ask_for_move(current_player)

      unless @board.place_symbol(row, col, current_player.symbol)
        puts "Invalid move. Try again."
        sleep(1)
        next
      end

      if @board.winner?
        system("clear") || system("cls")
        @board.display
        puts "#{current_player.name} has won with #{current_player.symbol}!"
        break
      elsif @board.full?
        system("clear") || system("cls")
        @board.display
        puts "It's a draw! No more moves available."
        break
      else
        switch_turn
      end
    end
  end

  private

  def ask_for_move(current_player)
    loop do
      print "#{current_player.name}, enter the row (1-3): "
      row_input = gets&.chomp
      print "#{current_player.name}, enter the column (1-3): "
      col_input = gets&.chomp

      row = Integer(row_input) rescue nil
      col = Integer(col_input) rescue nil

      if row && col && row.between?(1, 3) && col.between?(1, 3)
        row -= 1
        col -= 1

        if @board.valid_move?(row, col)
          return [row, col]
        else
          puts "The square is already taken or invalid. Try another one."
        end
      else
        puts "Invalid input. You must enter numbers between 1 and 3."
      end
    end
  end

  def switch_turn
    @current_index = 1 - @current_index
  end
end
