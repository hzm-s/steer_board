class Ui::ToggleIconComponent < ViewComponent::Base
  def initialize(size:, **options)
    @size = size
    @extra_data = options[:data] || {}
    @extra_class = options[:class] || []
  end
end
