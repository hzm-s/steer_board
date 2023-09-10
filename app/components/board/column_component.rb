class Board::ColumnComponent < ViewComponent::Base
  include TailwindHelper

  delegate :key, to: :@step

  def initialize(step:, items:, column_count: 1)
    @step = step
    @name = step.name
    @column_count = column_count
    @items = items
  end

  def width
    return 18 if @column_count == 1

    18 * @column_count + (@column_count + 1) * 0.5
  end

  def allow_src
    @step.previous&.key
  end

  private

  attr_reader :name, :items, :column_count
end
