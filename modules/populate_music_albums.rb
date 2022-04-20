require_relative 'save_data'

module PopulateMusicAlbums
  include SaveData

  def populate_music_albums
    music_albums_array = []
    json_music_albums = retrieve_data('music_albums')
    json_music_albums.each do |music_album|
      new_music_album = MusicAlbum.new(music_album['music_album']['publish_date'],
                                       on_spotify: music_album['music_album']['on_spotify'])
      new_music_album.change_id(music_album['music_album']['id'])
      new_music_album.author = @authors.find do |author|
      author.id == music_album['music_album']['author']['author']['id']
      end
      new_music_album.genre = @genres.find { |genre| genre.id == music_album['music_album']['genre']['genre']['id'] }
      new_music_album.label = @labels.find { |label| label.id == music_album['music_album']['label']['label']['id'] }
      new_music_album.source = @sources.find do |source|
        source.id == music_album['music_album']['source']['source']['id']
      end
      music_albums_array << new_music_album
    end
    music_albums_array
  end
end
