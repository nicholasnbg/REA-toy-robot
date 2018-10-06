require 'spec_helper'

describe Movements do

  describe '#rotate_[direction]' do
    let(:starting_position) { Position.new(1,2, facing) }
    let(:expected_position) { Position.new(1,2, expected_facing) }

    describe '#rotate_left' do

      subject { described_class.rotate_left(starting_position) }

      context 'from north' do
        let(:facing) { :north }
        let(:expected_facing) { :west }

        it 'returns new position with west facing' do
          expect(subject).to eq expected_position
        end
      end

      context 'from west' do
        let(:facing) { :west }
        let(:expected_facing) { :south }

        it 'returns new position with south facing' do
          expect(subject).to eq expected_position
        end
      end
    end

    describe '#rotate_right' do

      subject { described_class.rotate_right(starting_position) }

      context 'from east' do
        let(:facing) { :east }
        let(:expected_facing) { :south }

        it 'returns new position with south facing' do
          expect(subject).to eq expected_position
        end
      end

      context 'from west' do
        let(:facing) { :west }
        let(:expected_facing) { :north }

        it 'returns new position with north facing' do
          expect(subject).to eq expected_position
        end
      end
    end
  end
end