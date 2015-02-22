require 'spec_helper'

describe Enigma::Rotor do
  let(:rotor) { Rotor.new nil }

  describe '#rotate' do
    subject { rotor.position }

    context 'initially' do
      it { is_expected.to eq('A') }
    end

    context 'when I rotate once' do
      before { rotor.rotate }

      it { is_expected.to eq('B') }
    end

    context 'when I rotate 5 times' do
      before { 5.times { rotor.rotate } }

      it { is_expected.to eq('F') }
    end

    context 'when I rotate 25 times' do
      before { 25.times { rotor.rotate } }

      it { is_expected.to eq('Z') }
    end

    context 'when I rotate 26 times' do
      before { 26.times { rotor.rotate } }

      it { is_expected.to eq('A') }
    end

    context 'when I rotate 28 times' do
      before { 28.times { rotor.rotate } }

      it { is_expected.to eq('C') }
    end
  end
end
