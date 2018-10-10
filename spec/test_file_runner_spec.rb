require 'spec_helper'

describe TestFileRunner do
  let(:test_dir) { 'tests/' }
  let(:commander) { instance_double(Commander) }
  let(:test_file_runner) { described_class.new(commander ,test_dir) }

  describe '#run' do
    let(:test_file_name) { 'test_a.txt' }

    subject { test_file_runner.run(test_file_name) }

    before do
      allow(File).to receive(:exist?).with(file_path) { test_file_exists }
    end

    context 'test file exists' do
      let(:test_file_exists) { true }
      let(:line1) { 'some_line' }
      let(:line2) { 'some other line' }
      let(:text_file_lines) { [line1, line2] }
      let(:command) { instance_double(Command) }

      before do
        allow(File).to receive(:readlines).with(file_path) { text_file_lines }
        allow(commander).to receive(:return_command) { command }
        allow(command).to receive(:execute)
      end

      it 'executes the command for each line' do
        subject
        expect(command).to have_received(:execute).twice
      end
    end
  end

end