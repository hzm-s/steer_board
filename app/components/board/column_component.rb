class Board::ColumnComponent < ViewComponent::Base
  include TailwindHelper

  def initialize(name:, items:, column_count: 1)
    @name = name
    @items = items
    @column_count = column_count
  end

  def width
    return 16 if @column_count == 1

    16 * @column_count + (@column_count + 1) * 0.5
  end
end
