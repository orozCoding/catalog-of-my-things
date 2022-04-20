class Options
  def list
    [
      ['[1] - List all books', :list_books], ['[2] - List all music albums', :list_music_albums],
      ['[3] - List all games', :list_games],
      ['[4] - List all genres', :list_genres], ['[5] - List all labels', :list_labels],
      ['[6] - List all authors', :list_authors],
      ['[7] - Add a book', :add_book], ['[8] - Add a music album', :add_music_album],
      ['[9] - Add a game', :add_game], ['[10] - Exit app']
    ]
  end
end
