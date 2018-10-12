require 'spec_helper'

describe LeftCommand do
  let(:robot) { instance_double("Robot", placed?: robot_is_placed) }
  let(:left_command) { described_class.new(robot) }

  describe '#execute' do
    subject { left_command.execute }


    context 'robot is placed' do
      let(:robot_is_placed) { true }
      let(:current_position) { instance_double("Position") }
      let(:new_position) { instance_double("Position", facing: :east) }

      before do
        allow(robot).to receive(:current_position).and_return(current_position, new_position)
        allow(Movements).to receive(:rotate_left).with(current_position) { new_position }
        allow(robot).to receive(:current_position=).with(new_position)
        subject
      end

      it 'gives robot new position' do
        expect(robot).to have_received(:current_position=).with(new_position)
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
end