require_relative 'item'
require 'date'
require_relative 'music_album'

class Genre
  attr_accessor :items, :name
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1...10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def change_id(id)
    @id = id
  end
end
