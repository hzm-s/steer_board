class StepSetting < ApplicationRecord
  belongs_to :step

  after_initialize do
    has_pre_queue.nil? && self.has_pre_queue = false
    has_post_queue.nil? && self.has_post_queue = false
    allow_idea.nil? && self.allow_idea = false
    allow_add.nil? && self.allow_add = false
  end

  def states
    StateSet.new(step.id).tap do |set|
      set.add_pre_queue if has_pre_queue?
      set.add_post_queue if has_post_queue?
    end
  end

  def has_queue?
    states.pre_queue || states.post_queue
  end
end
