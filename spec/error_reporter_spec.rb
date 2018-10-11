require 'spec_helper'

describe ErrorReporter do
  let(:error_reporter) { class_double(described_class) }
  let(:error_object) { RoboError::NotPlaced.new }

  before do
    allow(error_reporter).to receive(:error).with(error_object)
  end

  describe '.error' do
    let(:error_message) { 'Some error message' }
    let(:error) { StandardError.new(error_message) }
    let(:error_class_name) { error.class.name }

    subject { described_class.error(error) }

    before do
      allow($stdout).to receive(:puts)
      subject
    end

    it 'prints an error with the class name and error message' do
      expect($stdout).to have_received(:puts).with("Error: #{error_class_name}")
      expect($stdout).to have_received(:puts).with("Message: #{error_message}")
    end
  end
end
