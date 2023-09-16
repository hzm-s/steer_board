class Ui::Board::ColumnComponent < ViewComponent::Base
  include UiBoardHelper

  def initialize(size:)
    @size = size
  end

  def width
    board_column_width(@size)
  end
end
