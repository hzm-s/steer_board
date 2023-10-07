class Step < ApplicationRecord
  acts_as_list scope: :work_flow

  has_many :states, -> { order(kind: :asc) }, class_name: 'StepState', dependent: :destroy, extend: StepStateSet

  attr_accessor :buffers

  after_initialize do
    if states.empty?
      self.states.build(kind: StepStateKind.from_name(:primary))
    end

    if Array(buffers).any?
      buffers.each { self.states.build(kind: StepStateKind.buffer_from_position(_1)) }
    end
  end

  def last_state_of_previous(work_flow)
    previous(work_flow)&.states&.last
  end

  def first_state_of_next(work_flow)
    self.next(work_flow)&.states&.first
  end

  def previous(work_flow)
    work_flow.previous_step_of(id)
  end

  def next(work_flow)
    work_flow.next_step_of(id)
  end
end
