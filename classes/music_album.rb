require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date, on_spotify: true)
    @on_spotify = on_spotify
    super(publish_date)
  end

  def can_be_archived?
    return true if super && @on_spotify
  end

  private :can_be_archived?
end
