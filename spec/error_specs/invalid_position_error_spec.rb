require 'spec_helper'

describe RoboError::InvalidPosition do
  subject { described_class.new }
  let(:message) { 'Sorry, that is an invalid position' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end