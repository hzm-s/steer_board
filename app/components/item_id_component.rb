class ItemIdComponent < ViewComponent::Base
  def initialize(item:, **options)
    @item = item
    @extra_class = options[:class] || []
  end
end
