require 'rails_helper'

describe 'work flow' do
  it do
    wf = WorkFlow.new

    todo = Step.new(name: 'Todo')
    prepare = Step.new(name: 'Prepare')
    dev = Step.new(name: 'Dev', has_post_queue: true)
    qa = Step.new(name: 'QA')
    deploy = Step.new(name: 'Deploy', has_pre_queue: true)
    done = Step.new(name: 'Done')

    wf.add_step(todo)
    wf.add_step(prepare)
    wf.add_step(dev)
    wf.add_step(qa)
    wf.add_step(deploy)
    wf.add_step(done)
    wf.save!

    expect(wf.steps).to eq [todo, prepare, dev, qa, deploy, done]

    expect(todo.states.map { _1.previous(wf) }).to eq [nil]
    expect(prepare.states.map { _1.previous(wf) }).to eq [todo.states.last]
    expect(dev.states.map { _1.previous(wf) }).to eq [prepare.states.last, dev.states.first]
    expect(qa.states.map { _1.previous(wf) }).to eq [dev.states.last]
    expect(deploy.states.map { _1.previous(wf) }).to eq [qa.states.last, deploy.states.first]
    expect(done.states.map { _1.previous(wf) }).to eq [deploy.states.last]

    expect(todo.states.map { _1.next(wf) }).to eq [prepare.states.first]
    expect(prepare.states.map { _1.next(wf) }).to eq [dev.states.first]
    expect(dev.states.map { _1.next(wf) }).to eq [dev.states.last, qa.states.first]
    expect(qa.states.map { _1.next(wf) }).to eq [deploy.states.first]
    expect(deploy.states.map { _1.next(wf) }).to eq [deploy.states.last, done.states.first]
    expect(done.states.map { _1.next(wf) }).to eq [nil]
  end
end
