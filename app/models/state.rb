class State < Struct.new(:step_id, :kind)
  delegate :name, to: :kind

  class << self
    def from_id(id)
      new(*id.split('__'))
    end
  end

  def initialize(step_id, kind_name)
    super(step_id, StateKind.from_name(kind_name))
  end

  def id
    "#{step_id}__#{kind}"
  end

  def previous(work_flow)
    step = work_flow.step_of(step_id)
    kind.previous_state_of(step, work_flow)
  end

  def next(work_flow)
    step = work_flow.step_of(step_id)
    kind.next_state_of(step, work_flow)
  end
end
