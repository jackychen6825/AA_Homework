class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over 
      take_turn
    end 
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if @game_over

    else 
      round_success_message
      @sequence_length += 1
    end 
  end

  def show_sequence
    add_random_color
    seq
  end

  def require_sequence
    duped_seq = @seq.dup 
    next_color = duped_seq.shift 
  
    until duped_seq.empty?
      puts "Enter color:"
      color = gets.chomp 

      if color == next_color 
        next_color = duped_seq.shift 
      else
        @game_over = true 
      end
    end 

  end

  def add_random_color
    colors = %w(red blue yellow green)
    @seq << colors.sample

  end

  def round_success_message
    puts "Great job completing the round"
  end

  def game_over_message
    puts "Sorry, game's over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []

  end
end
