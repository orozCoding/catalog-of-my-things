require_relative 'item'

class Game < Item
  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at)
  end

  def last_played_old
    return true if @last_played_at < DateTime.now.next_year(-2)
  end

  private :last_played_old

  def can_be_archived?
    return true if last_played_old && super
  end
end
