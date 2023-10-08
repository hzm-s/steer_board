class Step < ApplicationRecord
  acts_as_list scope: :work_flow

  has_one :setting, class_name: 'StepSetting', dependent: :destroy

  attr_accessor :pre_queue, :post_queue

  after_initialize do
    if !setting
      self.build_setting(has_pre_queue: pre_queue, has_post_queue: post_queue)
    end
  end

  def states
    setting.states
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
