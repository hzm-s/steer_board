class Kanban::StepComponent < ViewComponent::Base
  delegate :name, :limit, :has_buffer?, :states, to: :@step

  def initialize(step:, work_flow:)
    @step = step
    @work_flow = work_flow
  end

  def initial_step?
    @initial_step ||= @step.previous(@work_flow).nil?
  end
end
