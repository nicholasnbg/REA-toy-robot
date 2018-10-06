require 'spec_helper'

describe Robot do
  let(:robot) { described_class.new }

  describe '#placed?' do
    subject { robot.placed? }
    context 'robot is not placed' do
      it 'returns false' do
        expect(subject).to eq false
      end
    end

    context 'robot is placed' do
      before { robot.current_position = true }

      it 'returns true' do
        expect(subject).to eq true
      end
    end
  end

  describe '#report' do

  end
end