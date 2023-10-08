class Ui::ItemCardComponent < ViewComponent::Base
  def initialize(kind:, size:, **options)
    @kind = kind
    @size = size
    @extra_class = options[:class] || []
  end

  def color_type
    return :option if @kind == ItemKind.idea

    :primary
  end
end
