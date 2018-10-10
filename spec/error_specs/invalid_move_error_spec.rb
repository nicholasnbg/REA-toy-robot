require 'spec_helper'

describe RoboError::InvalidMove do
  subject { described_class.new }
  let(:message) { "Sorry, you can't move there" }
  it 'has message' do
    expect(subject.message).to eq message
  end
end