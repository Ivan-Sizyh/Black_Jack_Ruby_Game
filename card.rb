class Card
  attr_reader :denomination, :suit

  def initialize(denomination, suit)
    @denomination = denomination
    @suit = suit
  end

  def full_view
    @denomination + @suit
  end
end