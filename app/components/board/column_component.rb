class Board::ColumnComponent < ViewComponent::Base
  include TailwindHelper

  renders_one :footer

  delegate :name, to: :@step

  SPACE_WIDTH = 0.5

  def initialize(step:, items:, column_count: 1)
    @step = step
    @column_count = column_count
    @items = items
  end

  def width
    18 * @column_count + (SPACE_WIDTH * (@column_count + 1))
  end

  private

  attr_reader :step, :items, :column_count
end
