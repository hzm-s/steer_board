class ItemsController < ApplicationController
  ALL_ITEMS = {
    'Todo__primary' => [
      Item.new(kind: :idea, body: '[UI prototype] Cycle time'),
      Item.new(kind: :idea, body: '[UI prototype] Lead time'),
      Item.new(kind: :idea, body: '[UI prototype] Add item'),
      Item.new(kind: :idea, body: '[Dummy] ***'),
      Item.new(kind: :idea, body: '[Dummy] ***'),
      Item.new(kind: :idea, body: '[Dummy] ***'),
      Item.new(kind: :idea, body: '[Dummy] ***'),
      Item.new(kind: :idea, body: '[Dummy] ---'),
    ],
    'Analyze__primary' => [
      Item.new(kind: :idea, body: '[UI prototype] Backlog'),
    ],
    'Next10__primary' => [
      Item.new(kind: :feature, body: '[UI prototype] Item with tasks'),
      Item.new(kind: :feature, body: '[UI prototype] Move items'),
      Item.new(kind: :feature, body: '[UI prototype] Check to done'),
    ],
    'Develop__primary' => [
      Item.new(kind: :tech, body: 'Board (use ViewComponent)'),
      Item.new(kind: :other, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ***'),
      Item.new(kind: :feature, body: '[Dummy] ---'),
    ],
    'Develop__post_buffer' => [
      Item.new(kind: :feature, body: '[UI prototype] Board buffer'),
      Item.new(kind: :feature, body: '[UI prototype] Board column'),
    ],
    'QA__primary' => [
      Item.new(kind: :feature, body: '[UI prototype] Index page'),
      Item.new(kind: :rework, body: '[UI prototype] Individual pages'),
      Item.new(kind: :other, body: '[Setup] DB'),
      Item.new(kind: :other, body: '[Setup] Repository'),
    ],
    'QA__post_buffer' => [
    ],
    'Deploy__primary' => [
    ],
    'Production__primary' => [
      Item.new(kind: :other, body: '[Setup] git'),
      Item.new(kind: :other, body: '[Setup] rails'),
    ],
  }

  def index
    @state_id = params[:state_id]
    @items = ALL_ITEMS[@state_id]
  end

  def new
  end
end
