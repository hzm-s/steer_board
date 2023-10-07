class WorkFlow < ApplicationRecord
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy

  def add_step(step)
    self.steps << step
  end

  def step_of(base_step_id)
    steps.find { _1.id == base_step_id }
  end

  def previous_step_of(base_step_id)
    steps.find { _1.id == base_step_id }.higher_item
  end

  def next_step_of(base_step_id)
    steps.find { _1.id == base_step_id }.lower_item
  end
end
