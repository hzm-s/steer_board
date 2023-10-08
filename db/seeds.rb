force = ENV.fetch('FORCE', false)

if WorkFlow.count == 0 || force
  steps = [
    Step.new(name: 'Todo'),
    Step.new(name: 'Analyze'),
    Step.new(name: 'Next10', wip_limit: 10),
    Step.new(name: 'Develop', wip_limit: 8, has_post_queue: true),
    Step.new(name: 'QA', wip_limit: 6, has_post_queue: true),
    Step.new(name: 'Deploy'),
    Step.new(name: 'Production'),
  ]
  WorkFlow.new do |wf|
    steps.each do |step|
      wf.add_step(step)
    end
    wf.save!
  end
end

if Item.count == 0 || force
  wf = WorkFlow.last
  todo, analyze, next10, dev, qa, deploy, prod = *wf.steps

  items = {
    todo.states.primary => [
      Item.new(kind: ItemKind.idea, content: '[UI prototype] Cycle time'),
      Item.new(kind: ItemKind.idea, content: '[UI prototype] Lead time'),
      Item.new(kind: ItemKind.idea, content: '[UI prototype] Add item'),
      Item.new(kind: ItemKind.idea, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.idea, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.idea, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.idea, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.idea, content: '[Dummy] ---'),
    ],
    analyze.states.primary => [
      Item.new(kind: ItemKind.idea, content: '[UI prototype] Backlog'),
    ],
    next10.states.primary => [
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Item with tasks'),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Move items'),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Check to done'),
    ],
    dev.states.primary => [
      Item.new(kind: ItemKind.kaizen, content: 'Board (use ViewComponent)'),
      Item.new(kind: ItemKind.other, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ***'),
      Item.new(kind: ItemKind.feature, content: '[Dummy] ---'),
    ],
    dev.states.post_queue => [
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Board buffer'),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Board column'),
    ],
    qa.states.primary => [
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Index page'),
      Item.new(kind: ItemKind.rework, content: '[UI prototype] Individual pages'),
      Item.new(kind: ItemKind.other, content: '[Setup] DB'),
      Item.new(kind: ItemKind.other, content: '[Setup] Repository'),
    ],
    prod.states.primary => [
      Item.new(kind: ItemKind.other, content: '[Setup] git'),
      Item.new(kind: ItemKind.other, content: '[Setup] rails'),
    ],
  }
  items.each do |state, items_per_state|
    items_per_state.each do |item|
      item.initialize_status(wf)
      item.change_status(state, wf)
      item.save!
    end
  end
end
