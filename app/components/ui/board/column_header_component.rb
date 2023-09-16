class Ui::Board::ColumnHeaderComponent < ViewComponent::Base
  renders_one :counter

  def initialize(title:, sub_titles:)
    @title = title
    @sub_titles = sub_titles
  end
end
