class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)

    @cups = Array.new(14) {[]}
    self.place_stones #places the stones in the cup with helper method 
    @name1 = name1
    @name2 = name2

    # Array.new(6) {Array.new(4, :stone)} + [[]] + Array.new(6) {Array.new(4, :stone)} + [[]]
    #[[:stone, :stone, :stone, :stone],[:stone, :stone, :stone, :stone],[],[],[]]

  end

  def place_stones
    cups.each.with_index do |cup, i|
      if i >= 0 && i < 6 #0 1 2 3 4 5
        4.times do 
          cup << :stone 
        end 
      elsif i > 6 && i < 13 #7 8 9 10 11 12
        4.times do 
          cup << :stone
        end 
      end 
    end 
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)

    raise "Invalid starting cup" if start_pos < 0 || start_pos > cups.length 
    raise "Starting cup is empty" if cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    cup = cups[start_pos]
    num_stones = cup.length 
    #empty the cup 
    cups[start_pos] = []

    #based on the player, deterines which cup is not allowed 
    if current_player_name == name1 
      curr_cup_idx  = 6
      opponent_cup_idx = 13
    else 
      curr_cup_idx = 13
      opponent_cup_idx = 6
    end 

    curr_idx = start_pos
    while num_stones != 0 
      curr_idx += 1 
      num_stones -= 1

      if (curr_idx % 14) == opponent_cup_idx #if the next cup is the opponents cup skip it 
        curr_idx += 1
        cups[curr_idx % 14] << :stone 
      else 
        cups[curr_idx % 14] << :stone 
      end 
    end 

    render 
    next_turn
    return :prompt if curr_cup_idx == curr_idx % 14

  end

  def next_turn(ending_cup_idx)

    return :switch if cups[ending_cup_idx].empty?
    return ending_cup_idx if !cups[ending_cup_idx].empty?

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    case1 = (0..5).all? { |idx| cups[idx].empty? }
    case2 = (7..12).all? { |idx| cups[idx].empty? }

    case1 || case2

  end

  def winner
    return :draw if cups[6].length == 6 && cups[13].length == 6
    return name1 if cups[6].length == 6 && cups[13].length != 6
    return name2 if cups[13].length == 6 && cups[6].length != 6
  end
end
