class Kanban::ItemListComponent < ViewComponent::Base
  def initialize(state_id:, items:)
    @state_id = state_id
    @items = items
  end
end
