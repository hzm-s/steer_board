class IconButtonComponent < ViewComponent::Base
  def initialize(size: 1.75, data: {}, dropdown: false)
    @size = size
    @data = data
    @dropdown = dropdown
  end

  def data_for_dropdown
    return {} unless @dropdown

    { action: 'dropdown#toggle click@window->dropdown#hide' }
  end

  private

  attr_reader :size, :data
end
