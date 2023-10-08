class Kanban::StepHeaderComponent < ViewComponent::Base
  def initialize(step:)
    @step = step
  end

  def state_names
    return [] unless @step.has_queue?

    @step.states.map(&:name)
  end
end
