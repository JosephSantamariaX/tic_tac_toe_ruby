require_relative 'game'
require_relative 'player'

if __FILE__ == $0
  puts "Name of player 1 (will use 'X'):"
  name1 = gets&.chomp
  puts "Name of player 2 (will use 'O'):"
  name2 = gets&.chomp

  player1_name = name1.nil? || name1.empty? ? "Player 1" : name1
  player2_name = name2.nil? || name2.empty? ? "Player 2" : name2

  player1 = Player.new(player1_name, "X")
  player2 = Player.new(player2_name, "O")

  game = Game.new(player1, player2)
  game.play
end
