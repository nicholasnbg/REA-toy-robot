require 'spec_helper'

describe RoboError::MethodNotImplemented do
  subject { described_class.new }
  let(:message) { 'This method has not been implemented yet' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end