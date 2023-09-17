class Ui::Board::ColumnHeaderComponent < ViewComponent::Base
  renders_one :context_menu
  renders_one :counter

  def initialize(main_title:, sub_titles: [])
    @main_title = main_title
    @sub_titles = sub_titles
  end
end
