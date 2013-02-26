class Board
  attr_reader :player

  def initialize
    @x_cells = []
    @o_cells = []
    @player = "X"
    @cube = build_cells
  end

  def winner
    if column? || row? || diagonal? || depth_straight? || diagonal_diagonal? || row_diagonal? || column_diagonal?
      @player
    else
      nil
    end
  end

  def add_cell(row, column, depth=1)
    play_to_i = [row, column, depth].join.to_i
    if current_plays.include?(play_to_i)
      nil
    else
      @cube[row-1][column-1][depth-1] = @player
      current_plays << play_to_i  
      play_to_i
    end
  end

  def switch_player
    @player == 'X' ? @player = 'O' : @player = 'X' 
  end

  def build_cells
    Array.new(3) {Array.new(3) {Array.new(3) {'_'}}}
  end
 
  def to_s
    board_length = 5
    square1 = @cube[0]
    square2 = @cube[1]
    square3 = @cube[2]
    "#{print_square(@cube[0],board_length*2)}\n#{print_square(@cube[1],board_length)}\n#{print_square(@cube[2],0)}"
  end

  def print_square(rows,offset=0)
    row1 = rows[0]
    row2 = rows[1]
    row3 = rows[2]    
    "#{(' '*offset)+row1.join(' ')}\n#{(' '*offset)+row2.join(' ')}\n#{(' '*offset)+row3.join(' ')}\n"
  end

  private 

  def current_plays
    @player == 'X' ? @x_cells : @o_cells
  end

  def column?
    match_checker([100,200])
  end

  def row?
    match_checker([10,20])
  end

  def diagonal?
    match_checker([90,180,110,220])
  end

  def depth_straight?
    match_checker([1,2])
  end

  def diagonal_diagonal?
    match_checker([111,222,109,218])
  end

  def column_diagonal?
    match_checker([101,202,99,198])
  end

  def row_diagonal?
    match_checker([9,18,11,22])
  end

  def match_checker(winning_plays)
    total = 0
    array = current_plays
    last_play = array[-1]
    array.each do |play|
      if winning_plays.include?((last_play-play).abs)
        total += 1
      end
    end
    total == 2
  end

end
