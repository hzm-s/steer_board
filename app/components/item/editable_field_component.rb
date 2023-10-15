class Item::EditableFieldComponent < ViewComponent::Base
  renders_one :actions
  renders_one :field

  def initialize(label:, **options)
    @label = label
  end
end
