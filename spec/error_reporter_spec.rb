require 'spec_helper'

describe ErrorReporter do
  let(:error_reporter) { described_class.new(error_type) }
  let(:error_type) { 'not_placed' }

  it 'has an error name of "NotPlaced"' do
    expect(error_reporter.error_name).to eq 'NotPlaced'
  end
end
