class Ui::IconButtonComponent < ViewComponent::Base
  def initialize(**attrs)
    @size = attrs[:size] || 1.75
    @dropdown = attrs[:dropdown] || false
    @extra_data = attrs[:data] || {}
    @extra_class = attrs[:class] || []
    @silent_focus = attrs[:silent_focus] || false
  end

  def data_for_dropdown
    return {} unless @dropdown

    { action: 'dropdown#toggle click@window->dropdown#hide' }
  end

  def focus_class
    return %w(focus:ring-0) if @silent_focus

    []
  end

  private

  attr_reader :size, :extra_data, :extra_class
end
