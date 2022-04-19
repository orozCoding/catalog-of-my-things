require './classes/author'
require './classes/book'

describe Author do
  before :each do
    @author = Author.new('Adam', 'clark')
  end
  it 'Test Author class properties' do
    expect(@author).to be_an_instance_of Author
    expect(@author.id).to be_an(Integer)
    expect(@author.last_name).to be_a(String)
    expect(@author.first_name).to eq 'Adam'
  end

  it 'Test th add_item method' do
    book = Book.new('2022-05-05', 'Flock', 'bad')
    @author.add_item(book)
    expect(@author.items).to have_attributes(size: 1)
    expect(@author.items[0].author.first_name).to eq 'Adam'
    expect(book.author).to eq @author
  end
end
