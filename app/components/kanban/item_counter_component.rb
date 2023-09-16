class Kanban::ItemCounterComponent < ViewComponent::Base
  def initialize(limit: nil)
    @limit = limit
  end
end
