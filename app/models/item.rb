class Item < ApplicationRecord
  has_one :progress, dependent: :destroy

  composed_of :kind, class_name: 'ItemKind'
  composed_of :size, class_name: 'StoryPoint', mapping: { size: :to_i }, allow_nil: true

  alias_attribute :body, :content

  class << self
    def all_by_state(state)
      joins(:progress).merge(Progress.by_state(state))
    end
  end

  def short_id
    @short_id ||= id.split('-').first.slice(0, 4)
  end

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

  # FIXME:
  def contributors
    @contributors ||=
      begin
        size = kind == ItemKind.idea ? (0..1) : (1..3)

        size.to_a.sample.times.map { Member.random }.uniq
      end
  end
end
