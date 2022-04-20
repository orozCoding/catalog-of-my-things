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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'music_album' => {
        'id' => @id,
        'publish_date' => @publish_date,
        'on_spotify' => @on_spotify,
        'author' => @author,
        'genre' => @genre,
        'label' => @label,
        'source' => @source
      }
    }.to_json(*args)
  end

  private :can_be_archived?
end
