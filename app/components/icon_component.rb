class IconComponent < ViewComponent::Base
  def initialize(**attrs)
    @name = attrs[:name]
    @size = attrs[:size] || 1.5
    @style = attrs[:style] || :solid
    @extra_class = attrs[:class] || ''
  end

  def icon_class
    "fa-#{@style.to_s} fa-#{@name.to_s}"
  end

  private

  attr_reader :size, :extra_class
end
