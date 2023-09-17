module UiBoardHelper
  BASE_WIDTH = 18
  SPACE_WIDTH = 0.5 # tailwind 0.5rem = 2

  def single_column_size
    BASE_WIDTH
  end

  def board_column_width(column_count)
    (single_column_size * column_count) + (SPACE_WIDTH * (column_count + 1))
  end
end
