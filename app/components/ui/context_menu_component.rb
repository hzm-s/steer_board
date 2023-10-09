class Ui::ContextMenuComponent < ViewComponent::Base
  renders_one :menu

  def initialize(position: :right)
    @position = position
  end

  def left?
    @position == :left
  end
end
