class Kanban::ItemComponent < ViewComponent::Base
  delegate :kind, :body, to: :@item

  def initialize(item:)
    @item = item
  end

  def contributors
    @__contributors ||= (0..3).to_a.sample.times.map { Member.random }
  end
end
