class WorkFlow::StepSummaryListComponent < ViewComponent::Base
  include TailwindHelper

  def initialize(steps:, current_step_id: nil, base_width:, space:)
    @steps = steps
    @current_step_id = current_step_id
    @base_width = base_width
    @space = space
  end

  def width
    ((@steps.size + 1) * @base_width) + ((@steps.size + 2) * rem_from_tw(@space))
  end
end
