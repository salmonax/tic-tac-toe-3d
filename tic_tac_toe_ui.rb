require './lib/player'
require './lib/board'
require './lib/game'

board = Board.new
players = [Player.new("X"),Player.new("O")]
game = Game.new(board)

def make_play(game,board)
  puts "Please pick a row"
  row = gets.chomp
  puts "Please pick a column"
  column = gets.chomp
  puts "Please pick a depth"
  depth = gets.chomp
  unless board.add_cell(row.to_i, column.to_i, depth.to_i) != nil
    puts "That's already been played!"
    make_play(game,board)
  end
end
   
"Welcome to Tic Tac Toe"
until game.over?  
  players.each do
     puts "Player #{board.player}, your turn"
    # puts "Turn #{game.tick+1}: Please pick a row"
    # row = gets.chomp
    # puts "Turn #{game.tick+1}: Please pick a column"
    # column = gets.chomp
    # board.add_cell(row.to_i, column.to_i)
    make_play(game,board)
    board.winner
    game.add_tick
    break if board.winner != nil
    #board.switch_player 
  end
end
