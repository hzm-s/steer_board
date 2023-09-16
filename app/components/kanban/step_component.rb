class Kanban::StepComponent < ViewComponent::Base
  SPACE_WIDTH = 0.5

  delegate :name, :limit, to: :step

  renders_one :footer

  def initialize(step:, work_flow:)
    @step = step
    @work_flow = work_flow
  end

  def state_size
    step.states.size
  end

  def width
    18 * state_size + (SPACE_WIDTH * (state_size + 1))
  end

  private

  attr_reader :step, :work_flow
end
