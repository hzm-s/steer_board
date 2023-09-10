class IconButtonComponent < ViewComponent::Base
  def initialize(**attrs)
    @size = attrs[:size] || 1.75
    @dropdown = attrs[:dropdown] || false
    @extra_data = attrs[:data] || {}
    @extra_class = attrs[:class] || []
  end

  def data_for_dropdown
    return {} unless @dropdown

    { action: 'dropdown#toggle click@window->dropdown#hide' }
  end

  private

  attr_reader :size, :extra_data, :extra_class
end
