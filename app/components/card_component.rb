class CardComponent < ViewComponent::Base
  def initialize(kind:, body:)
    @kind = kind
    @body = body
  end

  private

  attr_reader :kind, :body
end
