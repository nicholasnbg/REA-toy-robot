require 'spec_helper'

describe RoboError::InvalidCommand do
  subject { described_class.new }
  let(:message) { 'Sorry, that is not a valid command' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end