class Player

  @@game_bank = 0

  attr_accessor :cards, :score
  attr_reader :bank, :name

  def initialize
    @score = 0
    @cards = []
    @bank = 100
    @name
  end

  def get_card(desk)
    @cards << desk.give_card
  end

  def make_bet
    if @bank > 0
      @bank -= 10
      @@game_bank += 10
    else
      puts "На балансе не хватает денег для ставки!"
    end
  end

end

