class Progress < ApplicationRecord
  composed_of :state, mapping: { step_id: :step_id, state_kind: :kind }

  def update_to(new_state, work_flow)
    self.tap { _1.state = new_state }
  end
end
