class Item < ApplicationRecord
  has_one :progress, dependent: :destroy

  serialize :kind, ItemKind
  serialize :size, StoryPoint

  def initialize_status(work_flow)
    self.build_progress(state: work_flow.initial_state)
  end

  def change_status(state, work_flow)
    self.progress = progress.update_to(state, work_flow)
  end

  def status
    progress.state
  end

  def kind=(a_kind)
    super

    return if size

    self.size = StoryPoint.unknown if a_kind.should_estimate?
  end
end
