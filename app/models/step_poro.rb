class Step < Struct.new(:id, :name, :limit, :state_map, keyword_init: true)
  def initialize(name:, limit: nil)
    super(
      id: name,
      name: name,
      limit: limit,
      state_map: {}
    )
    state_map[:primary] = State.new(parent_id: id, kind: :primary)
  end

  def set_pre_buffer
    state_map[:pre_buffer] = State.new(parent_id: id, kind: :pre_buffer)
  end

  def set_post_buffer
    state_map[:post_buffer] = State.new(parent_id: id, kind: :post_buffer)
  end

  def previous(work_flow)
    work_flow.previous_step_of(id)
  end

  def next(work_flow)
    work_flow.next_step_of(id)
  end

  def previous_state_of(state_id)
    state = states.find { _1.id == state_id }

    return nil if state.kind == :pre_buffer

    return state_map[:pre_buffer] if state.kind == :primary

    return state_map[:primary] if state.kind == :post_buffer

    raise
  end

  def next_state_of(state_id)
    state = states.find { _1.id == state_id }

    return nil if state.kind == :post_buffer

    return state_map[:post_buffer] if state.kind == :primary

    return state_map[:primary] if state.kind == :pre_buffer

    raise
  end

  def states
    state_map.slice(:pre_buffer, :primary, :post_buffer).values.compact
  end

  def first_state
    states.first
  end

  def last_state
    states.last
  end

  def has_buffer?
    states.size > 1
  end

  def hash
    id.hash
  end

  def ==(other)
    other.instance_of?(self.class) &&
      self.id == other.id
  end
  alias_method :eql?, :==
end
