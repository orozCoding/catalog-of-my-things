require 'date'

class Item
  attr_reader :id, :publish_date, :archived, :author, :genre, :label

  def initialize(publish_date)
    @id = Random.rand(1...10_000)
    @publish_date = DateTime.parse(publish_date)
    @archived = false
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  
  def can_be_archived?
    return true if @publish_date < DateTime.now.next_year(-10)
    
    false
  end
  
  private :can_be_archived?

  def move_to_archived
    @archived = true if can_be_archived?
  end
end
