require './classes/genre'
require './classes/item'
require 'date'

describe Genre do
  context 'When instantiated' do
    before(:all) do
      @genre = Genre.new('old skool')
      today = '2022-04-19'
      twelve_years = '2010-04-19'
      @item = Item.new(twelve_years)
      @item2 = Item.new(today)
    end

    it 'return the same length if item is dublicated' do
      @genre.add_item(@item)
      expect(@genre.items.length).to be(1)
    end

    it 'return the length of items' do
      @genre.add_item(@item2)
      expect(@genre.items.length).to be(2)
    end

    it 'instance of name' do
      instance_property = @genre.name
      expect(instance_property).to eq('old skool')
    end

    it 'instance of id' do
      instance_property = @genre.id
      expect(instance_property).not_to eq(-100)
    end
  end
end

describe Genre do
  context 'When instantiated' do
    before(:all) do
      @genre = Genre.new('old skool')
      today = '2022-04-19'
      twelve_years = '2010-04-19'
      @item = Item.new(twelve_years)
      @item2 = Item.new(today)
    end

    it 'Add item' do
      expect(@genre.items.length).to eq(0)
    end

    it 'Add item' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eq(1)
    end

    it 'Return true for an instance of Genre' do
      expect(@genre.instance_of?(Genre)).to be(true)
    end
  end
end
