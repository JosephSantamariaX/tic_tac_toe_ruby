# main.rb
require_relative 'game'
require_relative 'player'

if __FILE__ == $0
  puts "Nombre del jugador 1 (usará 'X'):"
  name1 = gets&.chomp
  puts "Nombre del jugador 2 (usará 'O'):"
  name2 = gets&.chomp

  player1_name = name1.nil? || name1.empty? ? "Jugador 1" : name1
  player2_name = name2.nil? || name2.empty? ? "Jugador 2" : name2

  player1 = Player.new(player1_name, "X")
  player2 = Player.new(player2_name, "O")

  game = Game.new(player1, player2)
  game.play
end
