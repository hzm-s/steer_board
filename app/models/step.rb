class Step < Struct.new(:name, :previous, :parent, keyword_init: true)
  def previous
    return nil unless super

    return parent.previous if super == :auto && parent

    super
  end

  def key
    return name unless parent

    "#{parent.key}__#{name}"
  end
end
