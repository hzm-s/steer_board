class Item::DetailComponent < ViewComponent::Base
  def initialize(item:, mode:, **options)
    @item = item
    @mode = mode
  end

  def edit?
    @mode == :edit
  end
end
