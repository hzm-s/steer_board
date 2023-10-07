class State0 < Struct.new(:id, :parent_id, :kind, keyword_init: true)
  NAMES = {
    primary: 'WIP',
    pre_buffer: 'Todo',
    post_buffer: 'Done',
  }

  def initialize(parent_id:, kind:)
    super(
      id: "#{parent_id}__#{kind}",
      parent_id: parent_id,
      kind: kind,
    )
  end

  def previous(work_flow)
    parent = work_flow.step_of(parent_id)

    parent.previous_state_of(id) ||
      parent.previous(work_flow)&.last_state
  end

  def next(work_flow)
    parent = work_flow.step_of(parent_id)

    parent.next_state_of(id) ||
      parent.next(work_flow)&.first_state
  end

  def name
    NAMES[kind]
  end
end
