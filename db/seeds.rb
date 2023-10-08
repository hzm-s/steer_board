if WorkFlow.count == 0 || ENV.fetch('FORCE', false)
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
    steps.each { wf.add_step(_1) }
    wf.save!
  end
end
