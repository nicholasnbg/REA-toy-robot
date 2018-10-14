require 'spec_helper'

describe Command do
  let(:robot) { instance_double("Robot") }
  let(:table) { instance_double("Table") }
  let(:position) { instance_double"Position"}

  let(:command) { described_class.new(robot, table, position) }

  describe '#execute' do
    subject {command.execute}

    before do
      allow(ErrorReporter).to receive(:error)
      subject
    end

    it 'raises MethodNotImplementedError' do
      expect(ErrorReporter).to have_received(:error).with(RoboError::MethodNotImplemented.new)
    end
  end
end