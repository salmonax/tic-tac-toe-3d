require 'rspec'
require 'player'

describe Player do 
  context '#initialize' do 
    it 'initializes an instance of player' do
      player = Player.new('Name')
      player.should be_an_instance_of Player
    end
  end
end