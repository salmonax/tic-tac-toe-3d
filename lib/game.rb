class Game
  attr_reader :tick
  def initialize(board)
    @board = board
    @tick = 0
  end

  def over?
     @tick == 27  || @board.winner != nil
  end

  def add_tick
    @tick += 1
  end
end