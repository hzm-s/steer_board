class ItemKind < Struct.new(:name)
  KINDS = %i(idea feature rework kaizen other).freeze

  class << self
    def all
      KINDS.map { new(_1) }
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
  end

  def initialize(name)
    raise ArgumentError, "#{name} is invalid #{self.class}" unless name.to_sym.in?(KINDS)

    super(name.to_sym)
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
