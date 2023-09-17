class Kanban::ItemComponent < ViewComponent::Base
  delegate :kind, :body, to: :@item

  def initialize(item:)
    @item = item
  end

  def item_id
    (100..3000).to_a.sample
  end

  def item_size
    [1, 3, 5, 8, 13, 21, '?'].sample
  end

  def contributors
    @__contributors ||= (0..3).to_a.sample.times.map { Member.random }.uniq
  end
end
