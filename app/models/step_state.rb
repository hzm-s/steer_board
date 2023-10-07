class StepState < ApplicationRecord
  serialize :kind, StepStateKind

  def previous(work_flow)
    step = work_flow.step_of(step_id)
    kind.previous_state_of(step, work_flow)
  end

  def next(work_flow)
    step = work_flow.step_of(step_id)
    kind.next_state_of(step, work_flow)
  end
end
