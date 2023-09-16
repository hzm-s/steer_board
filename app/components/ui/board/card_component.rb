class Ui::Board::CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :id
  renders_one :body

  def initialize(theme:)
    @theme = theme
  end
end
