require 'spec_helper'

describe RoboError::NoTestFile do
  subject { described_class.new('test_name') }
  let(:message) { 'test_name File does not exist' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end