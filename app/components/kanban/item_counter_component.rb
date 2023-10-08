class Kanban::ItemCounterComponent < ViewComponent::Base
  def initialize(wip_limit: nil)
    @wip_limit = wip_limit
  end
end
