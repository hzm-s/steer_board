class Board::InnerColumnComponent < ViewComponent::Base
  delegate :name, to: :@step

  def initialize(step:)
    @step = step
  end

  private

  attr_reader :step
end
