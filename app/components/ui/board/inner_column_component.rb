class Ui::Board::InnerColumnComponent < ViewComponent::Base
  include UiBoardHelper

  renders_one :body
  renders_one :footer
end
