class IconWithBorderComponent < ViewComponent::Base
  def initialize(name:, size: 1.5, style: :solid)
    @name = name
    @size = size
    @style = style
  end

  def border_size
    @size + 0.5;
  end
end
