require 'spec_helper'

describe Position do
  let(:position) { described_class.new(x, y,facing) }

  subject { position }

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

    it 'sets facing to nil' do
      expect(subject.facing ).to eq nil
    end
  end

  describe '#==' do
    subject { position.==(comapared_position) }
    let(:facing) { :north }

    let(:comapared_position) { described_class.new(c_x, c_y, c_facing) }

    context 'comparing Position with same coordinates' do
      let (:c_x) { x }
      let (:c_y) { y }
      let(:c_facing) { facing }

      it 'returns true' do
        expect(subject).to eq true
      end
    end

    context 'comparing Position with different coordinates' do
      let (:c_x) { x+1 }
      let (:c_y) { y+1 }
      let(:c_facing) { :south }

      it 'returns false' do
        expect(subject).to eq false
      end
    end
  end
end