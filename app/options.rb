class Options
  def list
    [
      ['[1] - List all books', :list_books], ['[2] - List all music albums', :list_music_albums],
      ['[3] - List all movies', :list_movies], ['[4] - List all games', :list_games],
      ['[5] - List all genres', :list_genres], ['[6] - List all labels', :list_labels],
      ['[7] - List all authors', :list_authors],
      ['[8] - Add a book', :add_book], ['[9] - Add a music album', :add_music_album],
       ['[10] - Add a game', :add_game], ['[11] - Exit app']
    ]
  end
end

