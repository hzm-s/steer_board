class Ui::AvatarComponent < ViewComponent::Base
  include UiHelper

  with_collection_parameter :member

  def initialize(member:, size:)
    @member = member
    @size = size
  end
end
