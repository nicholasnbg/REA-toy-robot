require 'spec_helper'

describe Table do
  let(:table) { described_class.new(length,width) }
  let(:length) { 5 }
  let(:width) { 5 }

  describe '#valid_position?' do
    subject { table.valid_position?(position) }

    let(:position) { Position.new(x, y, :north ) }

    context 'Position is valid' do
      let(:x) { width  - 1 }
      let(:y) { length - 1 }

      it 'returns true' do
        expect(subject).to eq true
      end
    end

    context 'Position is invalid' do
      context 'x is invalid' do
        let(:x) { width + 1 }
        let(:y) { length - 1 }

        it 'returns false' do
        expect(subject).to eq false
        end
      end

      context 'y is invalid' do
        let(:x) { width - 1 }
        let(:y) { length + 1 }

        it 'returns false' do
          expect(subject).to eq false
        end
      end
    end
  end
end