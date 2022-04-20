module BookModule
  def list_books
    if @books.empty?
      return puts '
      There are no books yet!
      '
    end

    @books.each_with_index do |book, index|
      puts "
      [#{index + 1}] - Author: #{book.author.first_name} #{book.author.last_name}
      Cover State: #{book.cover_state}. Label: #{book.label.title}.
      Publish date: #{book.publish_date.year}-#{book.publish_date.month}-#{book.publish_date.day}.
      "
    end
  end

  def book_input
    puts 'Enter Publish date: '
    publish_date = gets.chomp
    puts 'Enter Publisher\'s name: '
    publisher = gets.chomp
    cover_state = 'cover'
    until %w[good bad].include?(cover_state)
      puts 'What\'s the cover state? ["good"/"bad"]: '
      cover_state = gets.chomp
    end

    { publish_date: publish_date, publisher: publisher, cover_state: cover_state }
  end

  def add_book
    data = book_input

    book = Book.new(data[:publish_date], data[:publisher], data[:cover_state])

    book.author = select_author
    book.genre = select_genre
    book.label = select_label

    @books << book

    persist_data(@books, './data/books')

    puts '
    BOOK SUCCESFULLY CREATED!
    '
  end
end
