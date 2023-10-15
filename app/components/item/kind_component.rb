class Item::KindComponent < ViewComponent::Base
  def initialize(kind:, **options)
    @kind = kind
    @extra_class = options[:class] || []
  end
end
