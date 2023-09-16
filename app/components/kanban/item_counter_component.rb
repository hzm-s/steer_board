class Kanban::ItemCounterComponent < ViewComponent::Base
  def initialize(count:, limit: nil)
    @count = count
    @limit = limit
  end
end
