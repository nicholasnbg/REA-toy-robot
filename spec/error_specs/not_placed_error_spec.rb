require 'spec_helper'

describe RoboError::NotPlaced do
  subject { described_class.new }
  let(:message) { 'Whoops, the robot has not been placed yet' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end