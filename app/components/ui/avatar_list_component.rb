class Ui::AvatarListComponent < ViewComponent::Base
  def initialize(members:, size:)
    @members = members
    @size = size
  end
end
