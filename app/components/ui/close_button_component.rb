class Ui::CloseButtonComponent < ViewComponent::Base
  def initialize(**options)
    @extra_data = options[:data]
  end
end
