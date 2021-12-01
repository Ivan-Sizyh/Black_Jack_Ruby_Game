class Logic

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @interface = Interface.new(@user,@dealer)
  end

  def start
    @interface.set_user_name
    start_session
  end

  def start_session
    fold
    get_cards
    make_bets
  end

  def do_session_step
    if(@user.cards.size > 2) || (@dealer.cards.size > 2)
      open_cards
      continue_game
    else
      @interface.select_action
      case gets.chomp
      when "1"
        @user.take_card(@deck)
        @dealer.card_move(@deck, count_points(@dealer))
        do_session_step
      when "2"
        @dealer.card_move(@deck, count_points(@dealer))
        open_cards
      when "3"
        open_cards
        continue_game
      when "4"
        @interface.end_game
      else
        @interface.undefined_command
        do_session_step
      end
    end
  end

  def make_bets
    if @user.make_bet.nil?
      @interface.not_enough_money(@user.name)
      @interface.end_game
    else
      if @dealer.make_bet.nil?
        @interface.not_enough_money(@dealer.name)
        @interface.end_game
      else
        do_session_step
      end
    end
  end

  def get_cards
    @deck = Deck.new
    2.times {@user.take_card(@deck)}
    2.times {@dealer.take_card(@deck)}
    @interface.show_cards
  end

  # def calculate_points
  #   @user.count_points
  #   @dealer.count_points
  # end

  def open_cards
    @interface.open_cards
    user_score = count_points(@user)
    dealer_score = count_points(@dealer)
    @interface.show_score(user_score,dealer_score)
    if user_score > dealer_score && user_score <= 21
      win
    elsif user_score < dealer_score && dealer_score <= 21
      lose
    elsif user_score == dealer_score
      draw
    elsif user_score - dealer_score < 0
      win
    else
      lose
    end
  end

  def win
    @user.bank += Player.class_variable_get('@@game_bank')
    Player.class_variable_set('@@game_bank', 0)
    @interface.win
  end

  def lose
    @dealer.bank += Player.class_variable_get('@@game_bank')
    Player.class_variable_set('@@game_bank', 0)
    @interface.lose
  end

  def draw
    @user.bank += 10
    @dealer.bank += 10
    Player.class_variable_set('@@game_bank', 0)
    @interface.draw
  end

  def continue_game
    @interface.continue_game
    case gets.chomp
    when "1"
      start_session
    when "2"
      @interface.end_game
    else
      @output.undefined_command
      continue_game
    end
  end

  def fold
    @user.cards.clear
    @dealer.cards.clear
  end

  def count_points(user)
    score = 0
    user.cards.each do |card|
      if card.denomination == 'Q' || card.denomination == 'J' || card.denomination == 'K'
        score += 10
      elsif card.denomination == 'A'
        if score + 11 <= 21
          score += 11
        else
          score += 1
        end
      else
        score += card.denomination.to_i
      end
    end
    score
  end
end
