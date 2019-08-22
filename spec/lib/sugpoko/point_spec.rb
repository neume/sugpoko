require 'spec_helper'

RSpec.describe Sugpoko::Point do
  let(:point) { described_class.new(10, 20) }

  describe 'initialization' do
    context 'with hash' do
      let(:point) { described_class.new({x: 10, y: 20}) }

      it { expect(point.x).to eq(10) }
      it { expect(point.y).to eq(20) }
    end
  end

  describe 'addition' do
    context 'with Sugpoko::point' do
      let(:result) { point + described_class.new(1, 1) }

      it { expect(result).to eq(described_class.new(11, 21)) }
    end

    context 'with array' do
      let(:result) { point + [1, 1] }

      it { expect(result).to eq(described_class.new(11, 21)) }
    end

    context 'with hash' do
      let(:result) { point + {x: 1, y: 1 } }

      it { expect(result).to eq(described_class.new(11, 21)) }
    end
  end


  describe 'addition' do
    let(:result) { point + described_class.new(1, 1) }

    it { expect(result).to eq(described_class.new(11, 21)) }
  end

  describe 'subtraction' do
    let(:result) { point - described_class.new(1, 1) }

    it { expect(result).to eq(described_class.new(9, 19)) }
  end

  describe '#to_s' do
    it { expect(point.to_s).to eq('[10, 20]')}
  end
end
