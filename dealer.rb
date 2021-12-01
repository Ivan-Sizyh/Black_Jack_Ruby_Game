require_relative 'player'

class Dealer < Player

  attr_reader :name

  def initialize
    super
    @name = "Dealer"
  end

  def card_move(desk, score)
    if score < 17
      take_card(desk)
    end
  end

end
