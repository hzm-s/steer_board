class Kanban::StepHeaderComponent < ViewComponent::Base
  def initialize(step:, work_flow:)
    @step = step
    @work_flow = work_flow
  end

  def state_names
    return [] unless @step.has_queue?

    @step.states.map(&:name)
  end
end
