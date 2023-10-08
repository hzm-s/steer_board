class Item < ApplicationRecord
  serialize :kind, ItemKind
  serialize :size, StoryPoint

  def kind=(a_kind)
    super

    return if size

    self.size = StoryPoint.unknown if a_kind.should_estimate?
  end
end
