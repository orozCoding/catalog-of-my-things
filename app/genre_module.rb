module GenreModule
  def create_genre
    puts 'Enter genre name:'
    name = gets.chomp.to_s.capitalize
    genre = Genre.new(name)
    @genres << genre
  end

  def list_genres
    unless @genres.empty?
      puts ''
      return @genres.each_with_index do |genre, i|
        puts "[#{i + 1}] - #{genre.name}"
      end
    end

    puts '
    There are no genres yet!
    '
  end

  def select_genre
    unless @genres.empty?
      number = -1
      list_genres
      puts "[#{@genres.length + 1}] - Create new genre"
      until number.positive? && number <= @genres.length + 1
        puts 'Select one genre from the list above:'
        number = gets.chomp.to_i
      end
      return @genres[number.to_i - 1] if number <= @genres.length
    end

    create_genre
  end
end
