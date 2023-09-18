class Item < Struct.new(:id, :kind, :body, keyword_init: true)
  ALL_ITEMS = {
    'Todo__primary' => [
      Item.new(id: 100, kind: :idea, body: '[UI prototype] Cycle time'),
      Item.new(id: 101, kind: :idea, body: '[UI prototype] Lead time'),
      Item.new(id: 102, kind: :idea, body: '[UI prototype] Add item'),
      Item.new(id: 103, kind: :idea, body: '[Dummy] ***'),
      Item.new(id: 104, kind: :idea, body: '[Dummy] ***'),
      Item.new(id: 105, kind: :idea, body: '[Dummy] ***'),
      Item.new(id: 106, kind: :idea, body: '[Dummy] ***'),
      Item.new(id: 107, kind: :idea, body: '[Dummy] ---'),
    ],
    'Analyze__primary' => [
      Item.new(id: 108, kind: :idea, body: '[UI prototype] Backlog'),
    ],
    'Next10__primary' => [
      Item.new(id: 109, kind: :feature, body: '[UI prototype] Item with tasks'),
      Item.new(id: 110, kind: :feature, body: '[UI prototype] Move items'),
      Item.new(id: 111, kind: :feature, body: '[UI prototype] Check to done'),
    ],
    'Develop__primary' => [
      Item.new(id: 112, kind: :tech, body: 'Board (use ViewComponent)'),
      Item.new(id: 113, kind: :other, body: '[Dummy] ***'),
      Item.new(id: 114, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 115, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 116, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 117, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 118, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 119, kind: :feature, body: '[Dummy] ***'),
      Item.new(id: 120, kind: :feature, body: '[Dummy] ---'),
    ],
    'Develop__post_buffer' => [
      Item.new(id: 121, kind: :feature, body: '[UI prototype] Board buffer'),
      Item.new(id: 122, kind: :feature, body: '[UI prototype] Board column'),
    ],
    'QA__primary' => [
      Item.new(id: 123, kind: :feature, body: '[UI prototype] Index page'),
      Item.new(id: 124, kind: :rework, body: '[UI prototype] Individual pages'),
      Item.new(id: 125, kind: :other, body: '[Setup] DB'),
      Item.new(id: 126, kind: :other, body: '[Setup] Repository'),
    ],
    'QA__post_buffer' => [
    ],
    'Deploy__primary' => [
    ],
    'Production__primary' => [
      Item.new(id: 127, kind: :other, body: '[Setup] git'),
      Item.new(id: 128, kind: :other, body: '[Setup] rails'),
    ],
  }

  class << self
    def all_by_state(state_id)
      ALL_ITEMS[state_id]
    end

    def find(id)
      ALL_ITEMS.values.flatten.find { _1.id == id.to_i }
    end
  end

  def size
    @__size ||=
      begin
        return '?' if kind == :idea

        return nil if kind == :other

        [1, 3, 5, 8, 13, 21].sample
      end
  end

  def contributors
    @__contributors ||=
      begin
        size = kind == :idea ? (0..1) : (1..3)

        size.to_a.sample.times.map { Member.random }.uniq
      end
  end

  def due
    @__due ||=
      begin
        return nil unless kind == :feature

        return nil if (1..5).to_a.sample != 1

        Time.current.days_since((7..200).to_a.sample).to_date
      end
  end
end
