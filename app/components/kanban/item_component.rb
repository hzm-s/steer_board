class Kanban::ItemComponent < ViewComponent::Base
  delegate :kind, :body, to: :@item

  def initialize(item:)
    @item = item
  end
end
