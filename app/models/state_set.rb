class StateSet < SimpleDelegator
  def initialize(step_id)
    @step_id = step_id

    super([State.new(@step_id, :primary)])
  end

  def add_pre_queue
    self.unshift(State.new(@step_id, :pre_queue))
  end

  def add_post_queue
    self.push(State.new(@step_id, :post_queue))
  end

  def pre_queue
    find { _1.kind == StateKind::PreQueue }
  end

  def primary
    find { _1.kind == StateKind::Primary }
  end

  def post_queue
    find { _1.kind == StateKind::PostQueue }
  end

  def queues
    [pre_queue, post_queue].compact
  end
end
