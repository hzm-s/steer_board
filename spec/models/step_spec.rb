require 'rails_helper'

describe Step do
  let(:wf) { WorkFlow.create! }

  describe 'construction' do
    context 'given no queues' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev')
        expect(step.states.map(&:kind)).to eq [StateKind::Primary]
      end
    end

    context 'given pre queue' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev', pre_queue: true)
        expect(step.states.map(&:kind)).to eq [StateKind::PreQueue, StateKind::Primary]
      end
    end

    context 'given post queue' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev', post_queue: true)
        expect(step.states.map(&:kind)).to eq [StateKind::Primary, StateKind::PostQueue]
      end
    end
  end

  describe 'load' do
    it 'has states that set only' do
      step = described_class.new(work_flow_id: wf.id, name: 'Dev', pre_queue: true, post_queue: true)
      step.save!
      step.reload
      expect(step.states.map(&:kind)).to eq [StateKind::PreQueue, StateKind::Primary, StateKind::PostQueue]
    end
  end
end
