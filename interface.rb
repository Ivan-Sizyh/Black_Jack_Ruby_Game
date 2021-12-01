class Interface
  def initialize(user, dealer)
    @user = user
    @dealer = dealer
  end

  def set_user_name
    print "Введите ваше имя:"
    user_name = gets.chomp

    if user_name.empty?
      puts "Имя не может быть пустым!"
      set_user_name
    else
      @user.name = user_name
      puts "Здравствуйте, #{@user.name}"
    end
  end

  def start_session
    puts "Новый раунд начался!"
  end

  def make_bets
    puts "Игроки сделали ставки по 10 долларов"
    show_balance
  end

  def show_balance
    puts "Ваш баланс: #{@user.bank}"
  end

  def show_cards
    puts "Карты выданы!"
    print "Ваши карты:"
    @user.cards.each { |card| print " #{card.full_view} " }
    puts ""
    print "Карты диллера:"
    @dealer.cards.each {print" ** "}
    puts ""
  end

  def not_enough_money(player)
    if player == @dealer.name
      puts "У диллера закончились деньги!"
    elsif player == @dealer.name
      puts "У #{@user.name} закончились деньги!"
    end
  end

  def end_game
    puts "Игра завершена. Досвидания, #{@user.name}"
  end

  def select_action
    puts "Выберите действие:"
    puts "1 - Взять карту"
    puts "2 - Пропустить ход"
    puts "3 - Открыть карты"
    puts "4 - Выйти из игры"
    print "Операция:"
  end

  def open_cards
    print "Ваши карты:"
    @user.cards.each { |card| print " #{card.full_view} " }
    puts ""
    print "Карты диллера:"
    @dealer.cards.each { |card| print " #{card.full_view} " }
    puts ""
  end

  def show_score(user_score,dealer_score)
    puts "Ваши очки: #{user_score}"
    puts "Очки диллера: #{dealer_score}"
  end

  def win
    puts "Вы выйграли раунд!"
    show_balance
  end

  def lose
    puts "Вы проиграли раунд!"
    show_balance
  end

  def draw
    puts "Раунд завершился ничьей!"
    show_balance
  end

  def undefined_command
    puts "Неизвестная команда! Повторите выбор"
  end

  def continue_game
    puts "Продолжить игру?"
    puts "1 - Да"
    puts "2 - Нет"
  end

end
