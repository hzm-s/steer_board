class Ui::LabeledFieldComponent < ViewComponent::Base
  renders_one :actions
  renders_one :custom_value

  def initialize(label:, value: nil, size: :md, **options)
    @label = label
    @value = value
    @size = size
  end
end
