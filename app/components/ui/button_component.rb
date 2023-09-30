class Ui::ButtonComponent < ViewComponent::Base
  def initialize(kind: :primary, type: :submit, size: :md, form_builder: nil, **options)
    @kind = kind
    @type = type
    @size = size
    @form_builder = form_builder
  end
end