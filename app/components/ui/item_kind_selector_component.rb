class Ui::ItemKindSelectorComponent < ViewComponent::Base
  def initialize(name:, kinds:, builder:, **options)
    @name = name
    @kinds = kinds
    @builder = builder
    @extra_class = options[:class] || []
  end
end
