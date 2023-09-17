class Ui::Board::InnerColumnComponent < ViewComponent::Base
  include UiBoardHelper

  renders_one :header
  renders_one :body
end
