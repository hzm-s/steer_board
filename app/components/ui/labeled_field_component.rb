class Ui::LabeledFieldComponent < ViewComponent::Base
  renders_one :actions
  renders_one :field

  def initialize(name:)
    @name = name
  end
end
