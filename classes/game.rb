require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at, multiplayer: true)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at)
  end

  private

  def can_be_archived?
    return true if super && @last_played_at < DateTime.now.next_year(-2)

    false
  end
end
