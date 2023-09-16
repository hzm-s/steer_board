class Board::ColumnHeaderComponent < ViewComponent::Base
  def initialize(name:, limit:)
    @name = name
    @limit = limit
  end
end
