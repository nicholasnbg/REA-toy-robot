require 'spec_helper'

describe Parser do
  let(:parser) { described_class.new }
  describe '#parse' do
    subject { parser.parse(input) }

    context 'passed single word strings/commands' do
      context 'passed "move"' do
        let(:input) { 'move' }
        let(:expected_command) { 'move' }

        it 'returns CommandRequest object' do
          expect(subject).to be_a CommandRequest
        end

        it 'has @command of "move"' do
          expect(subject.command).to eq expected_command
        end
      end

      context 'passed with extra whitespace at start and end' do
        let(:input) { '   right    ' }
        let(:expected_command) { 'right' }

        it 'returns CommandRequest object' do
          expect(subject).to be_a CommandRequest
        end

        it 'has @command of "right"' do
          expect(subject.command).to eq expected_command
        end
      end

      context 'passed with only whitespace' do
        let(:input) {' '}

        it 'returns CommandRequest object' do
          expect(subject).to be_a CommandRequest
        end

        it 'has @command of nil' do
          expect(subject.command).to eq nil
        end
      end

      context 'passed with no argument' do
        let(:input) {}
        it 'returns CommandRequest object' do
          expect(subject).to be_a CommandRequest
        end

        it 'has @command of nil' do
          expect(subject.command).to eq nil
        end
      end
    end

    context 'passed command with arguments' do
      context 'passed place command' do
        context 'with clean arguements' do
          let(:input) { 'place 1,2,north' }
          let(:expected_command) { 'place' }
          let(:expected_args) { %w[1 2 north] }

          it 'returns CommandRequest object' do
            expect(subject).to be_a CommandRequest
          end

          it 'has @command of "place"' do
            expect(subject.command).to eq expected_command
          end

          it 'has @args of ["1","2","north"]' do
            expect(subject.args).to eq expected_args
          end
        end

        context 'with spacing between arguments' do
          let(:input) { 'place 1  ,  2   ,     north' }
          let(:expected_args) { %w[1 2 north] }

          it 'returns CommandRequest object' do
            expect(subject).to be_a CommandRequest
          end

          it 'has @args of ["1","2","north"]' do
            expect(subject.args).to eq expected_args
          end
        end

        context 'with non number arguments for x + y' do
          let(:input) { 'place text, text, north' }
          let(:expected_args) { [nil, nil, 'north'] }

          it 'returns CommandRequest object' do
            expect(subject).to be_a CommandRequest
          end

          it 'has @args of [nil,nil,"north"]' do
            expect(subject.args).to eq expected_args
          end
        end
      end
    end
  end
end