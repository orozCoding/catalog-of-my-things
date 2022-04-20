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
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
