require 'date'

class Item
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1...10000)
    @publish_date = DateTime.parse(publish_date)
    @archived = false
  end
end
