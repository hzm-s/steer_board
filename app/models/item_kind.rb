class ItemKind < Struct.new(:name)
  KINDS = %i(idea feature rework kaizen other).freeze

  class << self
    def all
      KINDS.map { new(_1) }
    end

    def from_name(name)
      raise ArgumentError, "#{name} is invalid item kind" unless name.to_sym.in?(KINDS)

      new(name.to_sym)
    end

    def load(name)
      return from_name(name) if name

      nil
    end

    def dump(obj)
      obj.to_s
    end
  end

  def to_s
    name.to_s
  end
end
