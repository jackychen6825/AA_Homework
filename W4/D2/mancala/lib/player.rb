class Player
  attr_reader :name, :side

  def initialize(name, side) #the side the user begins with 
    @name = name
    @side = side
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    start_pos = gets.chomp.to_i
    if (start_pos.between?(1,6) && @side != 1 || # 1 2 3 4 5 6: 6 sides per player 
        start_pos.between?(7,12) && @side != 2)
      raise "Not your side!"
    else
      start_pos
    end
  end
end


#player1 = Player.new(Jacky, 1)
#player1.prompt => Jacky please enter which cup you would like to start from:
#