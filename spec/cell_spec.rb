require 'rspec'
require 'cell'

describe Cell do 
  context '#initialize' do 
    it 'initializes an instance of cell with row, column and a player' do
      player = double
      Player.stub(:new).and_return(player)

      cell = Cell.new(1, 2, player)
      cell.should be_an_instance_of Cell
    end
  end
end