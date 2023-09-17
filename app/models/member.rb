class Member < Struct.new(:id, :avatar_path, keyword_init: true)
  class << self
    def random
      %w(a b c d e f g h i j).sample.then { new(id: _1) }
    end
  end

  def initialize(id:)
    path = "/images/avatars/avatar_#{id}.png"

    super(avatar_path: path)
  end
end
