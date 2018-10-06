require 'spec_helper'

describe MoveCommand do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5,5) }
  let(:place_command) { PlaceCommand.new(robot, table, position) }
  let(:move_command) { described_class.new(robot, table) }

  describe '#execute' do
    subject { move_command.execute }

    context 'robot is placed' do

      before do
        place_command.execute
        subject
      end

      context 'robot has able to move forward' do
        let(:position) { Position.new(1,2,:east) }
        let(:expected_position) { Position.new(2,2,:east) }

        it 'moves robot to expected position' do
          expect(robot.current_position).to eq expected_position
        end
      end

      context 'robot is at edge of table' do
        let(:position) { Position.new(5,5,:east) }
        let(:expected_position) { Position.new(5,5,:east) }

        it 'keeps robot at same position' do
          expect(robot.current_position).to eq expected_position
        end

        it 'returns ErrorReporter' do
          expect(subject).to be_a(ErrorReporter)
        end
      end
    end

    context 'robot is not placed' do

      before { subject }

      it 'returns not-placed error' do
        expect(subject).to eq 'Sorry, robot not placed yet'
      end
    end
  end
end