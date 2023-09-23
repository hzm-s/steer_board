class Kanban::ItemComponent < ViewComponent::Base
  delegate :id, :kind, :body, :size, :contributors, :due, to: :@item

  def initialize(item:)
    @item = item
  end
end
