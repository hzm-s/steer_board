class ItemKind < Struct.new(:name, keyword_init: true)
  KINDS = %i(idea feature rework tech other).freeze

  class << self
    def all
      KINDS.map { new(name: _1) }
    end
  end
end
