class Step < ApplicationRecord
  acts_as_list scope: :work_flow

  has_one :setting, class_name: 'StepSetting', dependent: :destroy

  delegate :wip_limit, :has_pre_queue, :has_post_queue, :has_queue?, :allow_idea, :allow_add, to: :setting
  attr_writer :wip_limit, :has_pre_queue, :has_post_queue, :allow_idea, :allow_add

  after_initialize do
    if !setting
      self.build_setting(
        wip_limit: @wip_limit,
        has_pre_queue: @has_pre_queue,
        has_post_queue: @has_post_queue,
      )
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
