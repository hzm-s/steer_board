class ItemKind < Struct.new(:name)
  KINDS = %i(idea feature rework kaizen other).freeze

  class << self
    def all
      KINDS.map { new(_1) }
    end

    def from_name(name)
      new(name.to_sym)
    end

    def idea
      new(:idea)
    end

    def feature
      new(:feature)
    end

    def rework
      new(:rework)
    end

    def kaizen
      new(:kaizen)
    end

    def other
      new(:other)
    end

    def load(name)
      return nil unless name

      from_name(name)
    end

    def dump(obj)
      obj.to_s
    end
  end

  def initialize(name)
    raise ArgumentError, "#{name} is invalid #{self.class}" unless name.to_sym.in?(KINDS)

    super
  end

  def should_estimate?
    name.in?(%i(idea feature))
  end

  def to_s
    name.to_s
  end

  def to_sym
    to_s.to_sym
  end
end
