class BooleanValue < Struct.new(:label, :value, keyword_init: true)
  class << self
    def all
      [
        new(label: 'yes', value: true),
        new(label: 'no', value: false),
      ]
    end
  end
end
