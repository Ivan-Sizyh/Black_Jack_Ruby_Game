require_relative 'Player'

class Dealer < Player

  attr_reader :name

  def initialize
    super
    @name = "Dealer"
  end

  def card_move(desk)
    if @score < 17
      take_card(desk)
    end
  end

end
