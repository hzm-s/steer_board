class ItemSizeComponent < ViewComponent::Base
  def initialize(**args)
    @size = args[:size]
    @element_size = args[:element_size] || :sm
    @extra_class = args[:class]
  end
end
