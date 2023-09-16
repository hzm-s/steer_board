module UiBoardHelper
  COLUMN_WIDTH = 18
  SPACE_WIDTH = 0.5

  def single_column_size
    COLUMN_WIDTH
  end

  def board_column_width(column_count)
    single_column_size * column_count + (SPACE_WIDTH * (column_count + 1))
  end
end
