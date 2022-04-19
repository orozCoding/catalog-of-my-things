require 'date'
require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify: true)
    @on_spotify = on_spotify
    super()
  end

  def can_be_archived?
    return true if Item.can_be_archived && on_spotify
  end
end
