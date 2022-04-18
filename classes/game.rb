require_relative 'item'

class Game < Item
  def initialize(publish_date, multiplayer, last_played)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played = DateTime.parse(last_played)
  end
end
