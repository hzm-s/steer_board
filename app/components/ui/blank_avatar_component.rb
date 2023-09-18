class Ui::BlankAvatarComponent < ViewComponent::Base
  include UiHelper

  def initialize(size:)
    @size = size
  end

  def outer_size
    avatar_size(@size)
  end

  def icon_size
    outer_size * 0.4
  end
end
