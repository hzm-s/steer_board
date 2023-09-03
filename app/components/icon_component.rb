class IconComponent < ViewComponent::Base
  def initialize(name:, size: 1.5, style: :solid)
    @name = name
    @size = size
    @style = style
  end

  def classes
    "fa-#{@style.to_s} fa-#{@name.to_s}"
  end
end
