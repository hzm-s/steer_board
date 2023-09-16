class Ui::Board::ColumnHeaderComponent < ViewComponent::Base
  def initialize(title:, limit:)
    @title = title
    @limit = limit
  end
end
