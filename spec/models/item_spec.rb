require 'rails_helper'

describe Item do
  it 'sets initial size by kind' do
    expect(described_class.new(kind: ItemKind.idea).size).to be_unknown
    expect(described_class.new(kind: ItemKind.feature).size).to be_unknown
    expect(described_class.new(kind: ItemKind.rework).size).to be_nil
    expect(described_class.new(kind: ItemKind.kaizen).size).to be_nil
    expect(described_class.new(kind: ItemKind.other).size).to be_nil
  end
end
