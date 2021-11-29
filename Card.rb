class Card
  attr_reader :cards

  def initialize
    @cards = []
    create_cards
  end

  def give_card

  end

  def create_cards
    card_denominations = %W[A K Q J 10 9 8 7 6 5 4 3 2]
    card_suits = %W[\u2660 \u2665 \u2666 \u2663] #1 - Пики, 2 - Черви, 3 - Буби, 4 - Крести

    card_denominations.each do |card_denomination|
      @cards << "#{card_denomination}#{card_suits[0]}"
      @cards << "#{card_denomination}#{card_suits[1]}"
      @cards << "#{card_denomination}#{card_suits[2]}"
      @cards << "#{card_denomination}#{card_suits[3]}"
    end
  end
end