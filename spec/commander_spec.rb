require 'spec_helper'

describe Commander do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5,5) }
  let(:parser) { Parser.new}
  let(:commander) { described_class.new(robot, table, parser) }

  describe '#return_command' do
    subject { commander.return_command(input) }

    context 'passed place command' do
      let(:input) { "place 1,2,north" }

      it 'returns PlaceCommand object' do
        expect(subject).to be_a PlaceCommand
      end
    end

    context 'passed move command' do
      let(:input) { "move" }

      it 'returns MoveCommand object' do
        expect(subject).to be_a MoveCommand
      end
    end

    context 'passed right command' do
      let(:input) { "right" }

      it 'returns RightCommand object' do
        expect(subject).to be_a RightCommand
      end
    end

    context 'passed left command' do
      let(:input) { "left" }

      it 'returns LeftCommand object' do
        expect(subject).to be_a LeftCommand
      end
    end

    context 'passed report command' do
      let(:input) { "report" }

      it 'returns ReportCommand object' do
        expect(subject).to be_a ReportCommand
      end
    end

    context 'passed invalid command' do
      let(:input) { "something not a real command" }

      it 'returns InvalidCommand object' do
        expect(subject).to be_a InvalidCommand
      end
    end
  end
end