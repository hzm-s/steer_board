require 'rails_helper'

describe Step do
  let(:wf) { WorkFlow.create! }

  describe 'construction' do
    context 'given no buffers' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev')
        step.save!

        expect(step.reload.states.map(&:kind)).to eq [StepStateKind::Primary]
      end
    end

    context 'given pre buffer' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev', buffers: [:pre])
        step.save!

        expect(step.reload.states.map(&:kind)).to eq [StepStateKind::PreBuffer, StepStateKind::Primary]
      end
    end

    context 'given post buffer' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev', buffers: [:post])
        step.save!

        expect(step.reload.states.map(&:kind)).to eq [StepStateKind::Primary, StepStateKind::PostBuffer]
      end
    end

    context 'given both buffers' do
      it do
        step = described_class.new(work_flow_id: wf.id, name: 'Dev', buffers: [:post, :pre])
        step.save!

        expect(step.reload.states.map(&:kind)).to eq [StepStateKind::PreBuffer, StepStateKind::Primary, StepStateKind::PostBuffer]
      end
    end
  end
end
