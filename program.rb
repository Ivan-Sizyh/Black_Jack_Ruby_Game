require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'card'
require_relative 'logic'
require_relative 'interface'
require_relative 'deck'

game = Logic.new
game.start
