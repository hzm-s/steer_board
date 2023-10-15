class Item::DueComponent < ViewComponent::Base
  def initialize(date:)
    @date = date
  end
end
