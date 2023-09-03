require "rails_helper"

RSpec.describe Board::ColumnComponent, type: :component do
  describe 'width css class' do
    it do
      base_attrs = { name: '', items: { count: 0 } }
      expect(described_class.new(**base_attrs.merge(column_count: 1)).width).to eq 16
      expect(described_class.new(**base_attrs.merge(column_count: 2)).width).to eq 33.5
      expect(described_class.new(**base_attrs.merge(column_count: 3)).width).to eq 50
    end
  end
end
