class Game
  def initialize(player1, player2)
    @players = [player1, player2]
  end

  def player_names
    @players.map(&:name).join(" and ")
  end

  def welcome
    puts "Welcome, #{player_names}!"
    puts "It's time to play Battleship."
  end

  def place_ships
    @players.each {|p| p.place_ships([2, 3, 3, 4, 5])}
  end

  def display_status
    puts "SHOTS TAKEN:"
    @players[0].display_target_grid
    puts
    puts "YOUR BOARD:"
    @players[0].display_ocean_grid
  end

  def take_turn
    shot = @players[0].call_shot
    if @players[1].fire_at_coordinates(shot)
      @players[0].record_hit(shot)
      puts "Hit!"
    else
      @players[0].record_miss(shot)
      puts "Miss!"
    end
    @players = @players.reverse
  end

  def game_over
    @players[0].sunk?
  end

  def winner
    @players[1] if game_over
  end

  def play
    welcome
    place_ships
    until game_over do
      take_turn
    end
    puts "Congratulations, #{winner.name}!  You won!"
  end
end
