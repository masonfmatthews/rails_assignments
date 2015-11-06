require './player'

class HumanPlayer < Player
  attr_accessor :name

  def initialize(name="Dave")
    @name = name
  end
end
