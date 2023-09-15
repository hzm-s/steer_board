class KanbansController < ApplicationController
  def show
    @work_flow = WorkFlow.new

    todo = Step.new(name: 'Todo')
    analyze = Step.new(name: 'Analyze')
    next_10 = Step.new(name: 'Next10')
    dev = Step.new(name: 'Develop').tap { _1.set_post_buffer }
    qa = Step.new(name: 'QA').tap { _1.set_post_buffer }
    deploy = Step.new(name: 'Deploy')
    production = Step.new(name: 'Production')

    [todo, analyze, next_10, dev, qa, deploy, production].each do |step|
      @work_flow.add_step(step)
    end
  end
end
