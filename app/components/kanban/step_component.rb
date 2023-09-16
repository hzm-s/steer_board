class Kanban::StepComponent < ViewComponent::Base
  include UiBoardHelper

  delegate :name, :limit, to: :@step

  def initialize(step:, work_flow:)
    @step = step
    @work_flow = work_flow
  end

  def state_size
    @step.states.size
  end

  def width
    board_column_width(state_size)
  end

  def initial_step?
    @initial_step ||= @step.previous(@work_flow).nil?
  end
end
