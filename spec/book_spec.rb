require './Classes/book'
require 'date'

describe Book do
  context 'when instantiated' do
    it 'with publish_date, publisher, and cover_state should create a Book' do
      book = Book.new('2000-04-04', 'Mango', 'good')
      expect(book.class).to eq Book
      expect(book.publish_date).to be_a(DateTime)
      expect(book.publisher).to eq 'Mango'
      expect(book.cover_state).to eq 'good'
    end
  end
  context 'when calling move_to_archived method' do
    it 'should archive the book if cover_state is bad' do
      book = Book.new('2022-04-04', 'Mango', 'bad')
      book.move_to_archived
      expect(book.archived).to eq true
    end
  end
end