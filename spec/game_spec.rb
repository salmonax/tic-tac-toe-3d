require 'rspec'
require 'game'

describe Game do 
  context '#initialize' do
    it 'initializes with Board' do
      board = double
      Board.stub(:new).and_return(board)
      game = Game.new(board)
    end
  end

  context '#over?' do
    it 'is true when 9 ticks are added' do
      game = Game.new('whatever')
      9.times { |i| game.add_tick }
      game.over?.should eq true
    end

    it 'is true when board.winner? is true' do
      board = double
      Board.stub(:new).and_return(board)
      board.should_receive(:winner)

      game = Game.new(board)
      game.over?
    end
  end

  context '#add_tick' do
    it 'adds 1 to @tick every turn' do
      game = Game.new('whatever')
      game.tick.should eq 0
      game.add_tick
      game.tick.should eq 1
    end
  end
end