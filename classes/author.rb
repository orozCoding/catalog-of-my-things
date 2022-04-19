require_relative 'item'

class Author
  attr_reader :first_name, :last_name, :id
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = Random.rand(1...10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
