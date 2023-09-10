class Board::ColumnComponent < ViewComponent::Base
  include TailwindHelper

  delegate :name, to: :@step

  def initialize(step:, items:, column_count: 1)
    @step = step
    @column_count = column_count
    @items = items
  end

  def width
    return 18 if @column_count == 1

    18 * @column_count + (@column_count + 1) * 0.5
  end

  private

  attr_reader :step, :items, :column_count
end
