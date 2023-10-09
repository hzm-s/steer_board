class Ui::LabeledFieldComponent < ViewComponent::Base
  renders_one :actions
  renders_one :custom_value

  def initialize(label:, value: nil, size: :md, bg: true, **options)
    @label = label
    @value = value
    @size = size
    @bg = bg
  end
end
