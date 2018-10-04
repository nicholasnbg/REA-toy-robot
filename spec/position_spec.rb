require 'spec_helper'

describe Position do

  subject { described_class.new(x, y,facing) }

  let(:x) { 1 }
  let(:y) { 2 }

  context 'Passed in valid coordinates' do
    let(:facing) { :north }

    let(:expected_x) { 1 }
    let(:expected_y) { 2 }
    let(:expected_facing) { :north }


    it 'holds correct x value' do
      expect(subject.x).to eq expected_x
    end

    it 'holds correct y value' do
      expect(subject.y).to eq expected_y
    end

    it 'holds correct facing value' do
      expect(subject.facing).to eq expected_facing
    end
  end

  context 'passed invalid facing direction' do
    let(:facing) { 'not a valid facing' }

    it 'raises an error' do
      expect { subject }.to raise_error(ArgumentError, 'Not a valid direction')
    end
  end
end