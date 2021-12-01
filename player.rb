class Player

  @@game_bank = 0

  attr_accessor :cards, :bank

  def initialize
    @cards = []
    @bank = 100
  end

  def take_card(desk)
    @cards << desk.give_card
  end

  def make_bet
    if @bank > 0
      @@game_bank += 10
      @bank -= 10
    end
  end

end