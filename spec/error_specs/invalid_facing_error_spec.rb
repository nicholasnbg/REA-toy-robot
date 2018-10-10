require 'spec_helper'

describe RoboError::InvalidFacing do
  subject { described_class.new }
  let(:message) { 'Whoops, that direction is not valid' }
  it 'has message' do
    expect(subject.message).to eq message
  end
end