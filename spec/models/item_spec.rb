require 'rails_helper'

describe Item do
  it 'sets initial size by kind' do
    expect(described_class.new(kind: ItemKind.idea).size).to be_unknown
    expect(described_class.new(kind: ItemKind.feature).size).to be_unknown
    expect(described_class.new(kind: ItemKind.rework).size).to be_nil
    expect(described_class.new(kind: ItemKind.kaizen).size).to be_nil
    expect(described_class.new(kind: ItemKind.other).size).to be_nil
  end

  describe 'status' do
    let(:step1) { Step.new(name: 'todo') }
    let(:step2) { Step.new(name: 'doing') }
    let(:step3) { Step.new(name: 'done') }

    let(:work_flow) do
      WorkFlow.new do |wf|
        [step1, step2, step3].each { wf.add_step(_1) }
        wf.save!
      end
    end

    it do
      item = described_class.new(kind: ItemKind.idea)
      item.initialize_status(work_flow)

      expect(item.status).to eq step1.states.primary

      item.change_status(step2.states.primary, work_flow)
      expect(item.status).to eq step2.states.primary
    end
  end
end
