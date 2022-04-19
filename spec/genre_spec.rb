require './classes/genre'
require './classes/item'
require 'date'

describe Genre do
  context 'When instantiated' do
    genre = Genre.new('old skool')

    today = Date.today
    twelve_years = Date.new(today.year - 12, today.month, today.day)
    item = Item.new(twelve_years)
    item2 = Item.new(today)

    it 'Add item' do
      genre.add_item = (item)
      expect(genre.items.length).to eq(1)
    end

    it 'Return true for an instance of Genre' do
      expect(genre.instance_of?(Genre)).to be(true)
    end

    it 'return the length of items' do
      genre.add_item = (item2)
      expect(genre.items.length).to be(2)
    end

    it 'instance of name' do
      instance_property = genre.name
      expect(instance_property).to eq('old skool')
    end

    it 'instance of id' do
      instance_property = genre.id
      expect(instance_property).not_to eq(-100)
    end
  end
end
