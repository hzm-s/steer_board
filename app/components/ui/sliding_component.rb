class Ui::SlidingComponent < ViewComponent::Base
  renders_one :title

  def initialize(id:, width:, **options)
    @id = id
    @width = width
    @extra_data = options[:data] || {}
    @extra_class = options[:class] || []
  end

  def sliding_target_id
    "sliding-target-#{@id}"
  end

  def data_attrs
    {
      sliding_width: @width,
    }.merge(@extra_data)
  end
end
