require 'rspec'
require 'board'
require 'cell'

describe Board do 
  context "#initialize" do
    it 'initializes an instance of Board with an argument of Cell' do
      board = Board.new
      board.should be_an_instance_of Board
    end
  end

  context '#add_cell' do
    it "add a cell to marked_cell" do
      board = Board.new
      board.add_cell(1,2,3).should eq 123
    end
  end

  context '#winner' do
    it 'is somebody who has three marks in a row horizontally' do
      board = Board.new
      board.add_cell(1,3,1)
      board.add_cell(2,3,1)
      board.add_cell(3,3,1)
      board.winner.should eq 'X'
    end

    it 'is somebody who has three marks in a row vertically' do
      board = Board.new
      board.add_cell(2,1,1)
      board.add_cell(2,2,1)
      board.add_cell(2,3,1)
      board.winner.should eq 'X'
    end

    it 'is somebody who has three marks in a row diagonal' do
      board = Board.new
      board.add_cell(3,3,1)
      board.add_cell(2,2,1)
      board.add_cell(1,1,1)
      board.winner.should eq 'X'
    end

    it 'is somebody who has three marks in a row one each depth' do
      board = Board.new
      board.add_cell(3,3,1)
      board.add_cell(3,3,2)
      board.add_cell(3,3,3)
      board.winner.should eq 'X'
    end

    it 'is somebody who has three marks in a row one each depth diagonally' do
      board = Board.new
      board.add_cell(1,1,1)
      board.add_cell(2,2,2)
      board.add_cell(3,3,3)
      board.winner.should eq 'X'
    end

    it 'is somebody who has three marks in a row one each diagonally on the same row plane' do
      board = Board.new
      board.add_cell(3,3,1)
      board.add_cell(3,2,2)
      board.add_cell(3,1,3)
      board.winner.should eq 'X'
    end

      it 'is somebody who has three marks in a row one each diagonally on the same column plane' do
      board = Board.new
      board.add_cell(3,3,1)
      board.add_cell(3,3,2)
      board.add_cell(3,3,3)
      board.winner.should eq 'X'
    end
  end
end