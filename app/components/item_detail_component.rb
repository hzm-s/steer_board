class ItemDetailComponent < ViewComponent::Base
  renders_one :main_content
  renders_one :note
  renders_one :current_contributors
  renders_one :kind
  renders_one :estimate
  renders_one :due

  def initialize(item:)
    @item = item
  end
end
