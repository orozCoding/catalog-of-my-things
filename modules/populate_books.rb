require_relative 'save_data'

module PopulateBooks
  include SaveData

  def populate_books
    books_array = []
    json_books = retrieve_data('books')
    json_books.each do |book|
      new_book = Book.new(book['book']['publish_date'], book['book']['publisher'], book['book']['cover_state'])
      new_book.change_id(book['book']['id'])
      new_book.author = @authors.find { |author| author.id == book['book']['author']['author']['id'] }
      new_book.genre = @genres.find { |genre| genre.id == book['book']['genre']['genre']['id'] }
      new_book.label = @labels.find { |label| label.id == book['book']['label']['label']['id'] }
      books_array << new_book
    end
    books_array
  end
end
