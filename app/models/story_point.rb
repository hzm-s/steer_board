class StoryPoint < Struct.new(:value)
  UNKNOWN_VALUE = 99

  VALUES = [0, 1, 2, 3, 5, 8, 13, 21, UNKNOWN_VALUE].freeze

  class << self
    def all
      VALUES.map { new(_1) }
    end

    def unknown
      new(UNKNOWN_VALUE)
    end
  end

  def initialize(value)
    raise ArgumentError, "#{value} is invalid #{self.class}" if value && !value.in?(VALUES)

    super
  end

  def unknown?
    value == UNKNOWN_VALUE
  end

  def to_i
    value
  end

  def to_s
    return '?' if unknown?

    to_i.to_s
  end
end
