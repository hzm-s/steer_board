class Board::InnerColumnComponent < ViewComponent::Base
  delegate :key, to: :@step

  def initialize(step:)
    @step = step
    @name = step.name
  end

  def allow_src
    @step.previous&.key
  end

  private

  attr_reader :name
end
