require './classes/label'
require './classes/book'

describe Book do
  context 'when instantiated' do
    it 'with title and color, it should create a Label' do
      label = Label.new('New', 'Blue')
      expect(label).to be_a(Label)
      expect(label.title).to eq 'New'
      expect(label.color).to eq 'Blue'
    end
  end
  context 'when adding an item' do
    it 'should add the item to the items array and also modify the item.label variable' do
      book = Book.new('2022-04-04', 'Mango', 'bad')
      label = Label.new('New', 'Blue')
      label.add_item(book)
      expect(label.items.length).to be 1
      expect(label.items[0]).to eq book
      expect(book.label).to eq label
    end
  end
end
