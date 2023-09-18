class Ui::AvatarComponent < ViewComponent::Base
  with_collection_parameter :member

  def initialize(member:)
    @member = member
  end
end
