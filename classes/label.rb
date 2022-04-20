class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1...10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def change_id(id)
    @id = id
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'label' => {
        'id' => @id,
        'title' => @title,
        'color' => @color
      }
    }.to_json(*args)
  end
end
