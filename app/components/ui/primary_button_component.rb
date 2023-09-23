class Ui::PrimaryButtonComponent < ViewComponent::Base
  def initialize(type: :submit, form_builder: nil, **options)
    @type = type
    @form_builder = form_builder
  end
end
