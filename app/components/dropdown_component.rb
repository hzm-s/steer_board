class DropdownComponent < ViewComponent::Base
  renders_one :trigger
  renders_one :dropping

  def initialize(position: :left)
    @position = position
  end

  def left?
    @position == :left
  end
end
