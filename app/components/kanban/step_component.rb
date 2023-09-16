class Kanban::StepComponent < ViewComponent::Base
  include UiBoardHelper

  delegate :name, :limit, :has_buffer?, :states, to: :@step

  def initialize(step:, work_flow:)
    @step = step
    @work_flow = work_flow
  end

  def width
    board_column_width(@step.states.size)
  end

  def initial_step?
    @initial_step ||= @step.previous(@work_flow).nil?
  end
end
