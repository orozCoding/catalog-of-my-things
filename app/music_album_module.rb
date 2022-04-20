module MusicAlbumModule
  def list_music_albums
    if @music_albums.empty?
      return puts '
      There are no music albums yet!
      '
    end

    @music_albums.each_with_index do |album, index|
      puts "[#{index + 1}] - Genre: #{album.genre.name}. Publish date: #{album.publish_date}.
      Is it on Spotify?: #{album.on_spotify}"
    end
  end

  def music_album_input
    puts 'Enter Publish date: '
    publish_date = gets.chomp
    spotify = 'no'
    until [true, false].include?(spotify)
      puts 'Is this album on Spotify? [yes / no]: '
      spotify = gets.chomp.downcase
      spotify = true if spotify == 'yes'
      spotify = false if spotify == 'no'
    end

    { publish_date: publish_date, on_spotify: spotify }
  end

  def add_music_album
    data = music_album_input

    music_album = MusicAlbum.new(data[:publish_date], on_spotify: data[:on_spotify])

    music_album.author = select_author
    music_album.label = select_label
    music_album.genre = select_genre

    @music_albums << music_album

    persist_data(@music_albums, './data/music_albums')

    puts '
    MUSIC ALBUM SUCCESFULLY CREATED!
    '
  end
end
