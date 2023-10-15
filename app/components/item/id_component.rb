class Item::IdComponent < ViewComponent::Base
  def initialize(item:, **options)
    @item = item
    @extra_class = options[:class] || []
  end
end
