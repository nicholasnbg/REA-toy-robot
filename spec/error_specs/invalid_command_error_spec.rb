require 'spec_helper'

describe RoboError::InvalidCommand do
  let(:message) { 'Sorry, that is not a valid command' }
  subject { described_class.new }

  it 'has message' do
    expect(subject.message).to eq message
  end
end