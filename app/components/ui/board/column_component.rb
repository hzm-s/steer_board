class Ui::Board::ColumnComponent < ViewComponent::Base
  include UiBoardHelper

  renders_one :header
  renders_one :body

  def initialize(size:, **extra)
    @size = size
    @extra_data = extra[:data] || {}
  end

  def width
    board_column_width(@size)
  end
end
