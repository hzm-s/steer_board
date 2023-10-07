module StepStateSet
  def pre_buffer
    find { _1.kind == StepStateKind::PreBuffer }
  end

  def primary
    find { _1.kind == StepStateKind::Primary }
  end

  def post_buffer
    find { _1.kind == StepStateKind::PostBuffer }
  end

  def buffers
    [pre_buffer, post_buffer].compact
  end
end
