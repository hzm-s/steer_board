class Ui::IconComponent < ViewComponent::Base
  def initialize(**attrs)
    @name = attrs[:name]
    @style = attrs[:style] || :solid
    @size = attrs[:size] || 1.5
    @extra_data = attrs[:data] || {}
    @extra_class = attrs[:class] || []
  end

  def icon_class
    ["fa-#{@style}", "fa-#{@name}"]
  end

  private

  attr_reader :size, :extra_class
end
