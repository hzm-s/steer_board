force = ENV.fetch('FORCE', false)

if force
  Item.destroy_all
  WorkFlow.destroy_all
end

if WorkFlow.count == 0
  steps = [
    Step.new(name: 'Todo', description: "The first step.\n\n(Queue)"),
    Step.new(name: 'Analyze', description: "Analyze. Idea => Feature\n\nCan skip this step when bug"),
    Step.new(name: 'Next10', description: "Upcoming items\n\n(Queue)", wip_limit: 10),
    Step.new(name: 'Develop', wip_limit: 8, has_post_queue: true),
    Step.new(name: 'QA', wip_limit: 6, has_post_queue: true),
    Step.new(name: 'Deploy'),
    Step.new(name: 'Production', description: 'Done!'),
  ]
  WorkFlow.new do |wf|
    steps.each do |step|
      wf.add_step(step)
    end
    wf.save!
  end
end

if Item.count == 0
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
      Item.new(kind: ItemKind.idea, content: '[UI prototype] Backlog', size: StoryPoint.new(21)),
    ],
    next10.states.primary => [
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Item with tasks', size: StoryPoint.new(8)),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Move items', size: StoryPoint.new(8)),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Check to done', size: StoryPoint.new(5)),
    ],
    dev.states.primary => [
      Item.new(kind: ItemKind.kaizen, content: 'Board (use ViewComponent)', size: StoryPoint.new(3)),
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
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Board buffer', size: StoryPoint.new(13)),
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Board column', size: StoryPoint.new(8)),
    ],
    qa.states.primary => [
      Item.new(kind: ItemKind.feature, content: '[UI prototype] Index page', size: StoryPoint.new(2)),
      Item.new(kind: ItemKind.rework, content: '[UI prototype] Individual pages', size: StoryPoint.new(1)),
      Item.new(kind: ItemKind.other, content: '[Setup] DB'),
      Item.new(kind: ItemKind.other, content: '[Setup] Repository'),
    ],
    prod.states.primary => [
      Item.new(kind: ItemKind.other, content: '[Setup] git', size: StoryPoint.new(1)),
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
