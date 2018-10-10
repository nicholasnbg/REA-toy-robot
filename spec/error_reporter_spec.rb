require 'spec_helper'

describe ErrorReporter do
  let(:error_reporter) { class_double(described_class) }
  let(:error_object) { RoboError::NotPlaced.new }

  before do
    allow(error_reporter).to receive(:error).with(error_object)
  end

  it 'executes error method' do
    expect(ErrorReporter.error(error_object)).to have_received(:error)
  end
end
