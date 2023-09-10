class Board::ItemListComponent < ViewComponent::Base
  delegate :key, to: :@step

  def initialize(step:)
    @step = step
  end

  def allow_src
    @step.previous&.key
  end
end
