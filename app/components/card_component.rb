class CardComponent < ViewComponent::Base
  def initialize(kind:, body:)
    @kind = kind
    @body = body
  end
end
