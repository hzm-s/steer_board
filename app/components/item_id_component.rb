class ItemIdComponent < ViewComponent::Base
  def initialize(**args)
    @id = args[:id]
    @extra_class = args[:class] || []
  end
end
