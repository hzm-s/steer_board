class Ui::ContextMenuComponent < ViewComponent::Base
  def initialize(position: :right)
    @position = position
  end

  def left?
    @position == :left
  end
end
