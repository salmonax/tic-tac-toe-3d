class Cell
  attr_reader :name

  def initialize(row, column, name)
    @name = name
  end
end