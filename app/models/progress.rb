class Progress < ApplicationRecord
  composed_of :state, mapping: { step_id: :step_id, state_kind: :kind }

  class << self
    def by_state(state)
      where(step_id: state.step_id, state_kind: state.kind.to_s)
    end
  end

  def update_to(new_state, work_flow)
    self.tap { _1.state = new_state }
  end
end
