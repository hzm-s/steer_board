class Kanban::ItemComponent < ViewComponent::Base
  delegate :kind, :body, to: :@item

  def initialize(item:)
    @item = item
  end

  def item_id
    (100..3000).to_a.sample
  end

  def contributors
    @__contributors ||= (0..3).to_a.sample.times.map { Member.random }
  end
end
