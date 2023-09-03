class Board::ColumnComponent < ViewComponent::Base
  include TailwindHelper

  def initialize(name:, items:, column_count: 1)
    @name = name
    @items = items
    @column_count = column_count
  end

  def css_class_width
    size = 16 * @column_count + (@column_count - 1) * 1.5
    "basis-[#{tw_size(size)}rem]"
  end
end
