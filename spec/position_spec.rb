require 'spec_helper'

describe Position do
  context 'Passed in valid coordinates' do
    subject { described_class.new(1,2,:north) }

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
end