require 'rails_helper'

RSpec.describe WorkFlow::StepSummaryListComponent, type: :component do
  it 'width' do
    steps = [Step.new, Step.new, Step.new]
    c = described_class.new(steps: steps, base_width: 10, space: 2)
    expect(c.width).to eq (40 + 2.5)
  end
end
