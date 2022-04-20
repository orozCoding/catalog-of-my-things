require_relative 'save_data'

module PopulateGames
  include SaveData

  def populate_games
    games_array = []
    json_games = retrieve_data('games')
    json_games.each do |game|
      new_game = Game.new(game['game']['publish_date'], game['game']['last_played_at'],
                          multiplayer: game['game']['multiplayer'])
      new_game.change_id(game['game']['id'])
      new_game.author = @authors.find { |author| author.id == game['game']['author']['author']['id'] }
      new_game.genre = @genres.find { |genre| genre.id == game['game']['genre']['genre']['id'] }
      new_game.label = @labels.find { |label| label.id == game['game']['label']['label']['id'] }
      new_game.source = @sources.find { |source| source.id == game['game']['source']['source']['id'] }
      games_array << new_game
    end
    games_array
  end
end
