class Board::ColumnHeaderComponent < ViewComponent::Base
  def initialize(name:, items:)
    @name = name
    @items = items
  end
end
