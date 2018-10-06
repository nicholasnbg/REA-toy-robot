require 'spec_helper'

describe PlaceCommand do
  let(:robot) { Robot.new }
  let(:table_length) { 5 }
  let(:table_width) { 5 }
  let(:table) { Table.new(table_length, table_width) }
  let(:place_command) { described_class.new(robot, table, position) }

  describe '#execute' do
    subject { place_command.execute }

    context 'with valid position' do
      let(:position) { Position.new(table_length, table_width, :north) }

      before { subject }

      it 'places robot at position' do
        expect(robot.current_position).to eq position
      end
    end

    context 'with invalid position' do
      let(:position) { Position.new(table_length + 1, table_width + 1, :north) }

      before { subject }

      it 'does not place robot at position' do
        expect(robot.current_position).not_to eq position
      end

      it 'returns ErrorReporter' do
        expect(subject).to be_a(ErrorReporter)
      end
    end
  end
end