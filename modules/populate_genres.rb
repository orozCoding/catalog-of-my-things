require_relative 'save_data'

module PopulateGenres
  include SaveData

  def populate_genres
    genres_array = []
    json_genres = retrieve_data('genres')
    json_genres.each do |genre|
      new_genre = Genre.new(genre['genre']['name'])
      new_genre.change_id(genre['genre']['id'])
      genres_array << new_genre
    end
    genres_array
  end
end
