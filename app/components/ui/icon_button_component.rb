class Ui::IconButtonComponent < ViewComponent::Base
  def initialize(size: 1.75, dropdown: false, silent_focus: false, **options)
    @size = size
    @dropdown = dropdown
    @silent_focus = silent_focus
    @extra_data = options[:data] || {}
    @extra_class = options[:class] || []
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
