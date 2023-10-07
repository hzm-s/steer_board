class WorkFlow
  attr_reader :steps

  def initialize
    @steps = []
  end

  def add_step(step)
    @steps << step
  end

  def update_step(step)
    index = @steps.index(step)
    @steps[index] = step
  end

  def step_of(step_id)
    @steps.find { _1.id == step_id }
  end

  def previous_step_of(step_id)
    step = step_of(step_id)

    index_of_previous = @steps.index(step) - 1
    return nil if index_of_previous < 0

    @steps[index_of_previous]
  end

  def next_step_of(step_id)
    step = step_of(step_id)

    index_of_next = @steps.index(step) + 1
    @steps[index_of_next]
  end
end
