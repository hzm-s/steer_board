class EditStepForm
  include ActiveModel::Model

  attr_accessor :name, :wip_limit, :description, :buffers, :allow_idea, :can_add

  class << self
    def from_step(step)
      new(
        name: step.name,
        wip_limit: step.wip_limit,
        description: '',
        buffers: step.states.buffers.map { _1.kind.buffer_position },
        allow_idea: nil,
        can_add: nil,
      )
    end
  end
end
