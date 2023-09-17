class Kanban::ItemListComponent < ViewComponent::Base
  def initialize(items:)
    @items = items
  end
end
