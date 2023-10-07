class Kanban::FrameComponent < ViewComponent::Base
  def initialize(**options)
    @extra_class = options[:class] || []
    @extra_data = options[:data] || {}
  end
end
