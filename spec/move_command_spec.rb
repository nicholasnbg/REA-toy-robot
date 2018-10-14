require 'spec_helper'

describe MoveCommand do
  let(:robot) { instance_double("Robot", placed?: robot_is_placed) }
  let(:table) { instance_double("Table") }
  let(:move_command) { described_class.new(robot, table) }

  describe '#execute' do
    subject { move_command.execute }

    context 'robot is placed' do
      let(:robot_is_placed) { true }

      before do
        allow(move_command).to receive(:move_robot_forward)
        subject
      end

      it 'calls move_robot_forward method' do
        expect(move_command).to have_received(:move_robot_forward)
      end
    end

    context 'robot is not placed' do
      let(:robot_is_placed) { false }

      before do
        allow(ErrorReporter).to receive(:error)
        subject
      end

      it 'ErrorReporter receives message' do
        expect(ErrorReporter).to have_received(:error).with(RoboError::NotPlaced)
      end
    end
  end

  describe '#move_robot_forward' do
    subject { move_command.send(:move_robot_forward) }
    let(:current_position) { instance_double("Position") }
    let(:new_position) { instance_double("Position") }
    let(:robot_is_placed) { true }

    context 'moves to valid position' do

      before do
        allow(table).to receive(:valid_position?).with(new_position) { true }
        allow(robot).to receive(:current_position).and_return(current_position, new_position)
        allow(Movements).to receive(:move_forward).with(current_position) { new_position }
        allow(robot).to receive(:current_position=).with(new_position)
        subject
      end

      it 'gives robot new position' do
        expect(robot).to have_received(:current_position=)
      end
    end

    context 'moves to invalid position' do

      before do
        allow(table).to receive(:valid_position?).with(new_position) { false }
        allow(robot).to receive(:current_position).and_return(current_position, new_position)
        allow(Movements).to receive(:move_forward).with(current_position) { new_position }
        allow(ErrorReporter).to receive(:error)
        subject
      end

      it 'ErrorReporter receives message' do
        expect(ErrorReporter).to have_received(:error).with(RoboError::InvalidMove)
      end
    end
  end
end