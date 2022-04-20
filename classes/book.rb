require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state.to_s
  end

  alias parent_can_be_archived? can_be_archived?

  private

  def can_be_archived?
    return true if parent_can_be_archived? || cover_state == 'bad'

    false
  end
end
