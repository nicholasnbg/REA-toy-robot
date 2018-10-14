require 'spec_helper'

describe RoboError::InvalidPlace do
  subject { described_class.new }
  let(:message) { 'To place the robot use the syntax: "place x, y, facing"' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end