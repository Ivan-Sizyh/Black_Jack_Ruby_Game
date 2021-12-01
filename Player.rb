class Player

  @@game_bank = 0

  attr_accessor :cards, :score, :bank

  def initialize
    @score = 0
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

  def count_points
    @cards.each do |card|
      if card.denomination == 'Q' || card.denomination == 'J' || card.denomination == 'K'
        @score += 10
      elsif card.denomination == 'A'
        if @score + 11 <= 21
          @score += 11
        else
          @score += 1
        end
      else
        @score += card.denomination.to_i
      end
    end
  end

end