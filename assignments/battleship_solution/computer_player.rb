require './player'

class ComputerPlayer < Player

  def name
    "HAL 9000"
  end

  def place_ships(lengths)
    lengths.each_with_index do |len, i|
      grid.place_ship(Ship.new(len), i+1, 1, false)
    end
    puts "#{name} has placed its ships."
  end

  def call_shot
    "A1"
  end
end
