class Ui::ModalBackgroundComponent < ViewComponent::Base
  def initialize(**options)
    @extra_data = options[:data] || {}
    @extra_class = options[:class] || []
  end
end
