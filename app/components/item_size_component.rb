class ItemSizeComponent < ViewComponent::Base
  def initialize(size:, decorate: true, **args)
    @size = size
    @decorate = decorate
    @element_size = args[:element_size] || :sm
    @extra_class = args[:class] || []
  end
end
