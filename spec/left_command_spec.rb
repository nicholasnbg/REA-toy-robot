require 'spec_helper'

describe LeftCommand do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5,5) }
  let(:place_command) { PlaceCommand.new(robot, table, position) }
  let(:left_command) { described_class.new(robot) }

  describe '#execute' do
    subject { left_command.execute }

    context 'robot is placed' do
      let(:position) { Position.new(2,2,:north) }
      let(:expected_position) { Position.new(2,2,:west) }

      before do
        place_command.execute
        subject
      end

      it 'rotates robot to east' do
        expect(robot.current_position).to eq expected_position
      end
    end

    context 'robot is not placed' do
      it 'leaves robot current position unchanged' do
        expect(robot.current_position).to eq nil
      end
    end
  end
end