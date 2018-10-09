require 'spec_helper'

describe Robot do
  let(:robot) { described_class.new }
  let(:position) { Position.new(2,2,:north) }
  let(:table) { Table.new(5,5) }
  let(:place_command) { PlaceCommand.new(robot, table, position) }

  describe '#placed?' do
    subject { robot.placed? }
    context 'robot is not placed' do
      it 'returns false' do
        expect(subject).to eq false
      end
    end

    context 'robot is placed' do
      before { place_command.execute }

      it 'returns true' do
        expect(subject).to eq true
      end
    end
  end
end