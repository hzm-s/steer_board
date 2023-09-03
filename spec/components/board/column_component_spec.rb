require "rails_helper"

RSpec.describe Board::ColumnComponent, type: :component do
  describe 'width css class' do
    it do
      expect(described_class.new(count: 1).css_class_width).to eq 'basis-[16rem]'
      expect(described_class.new(count: 2).css_class_width).to eq 'basis-[33.5rem]'
      expect(described_class.new(count: 3).css_class_width).to eq 'basis-[51rem]'
    end
  end
end
