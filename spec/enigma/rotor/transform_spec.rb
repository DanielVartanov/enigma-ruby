require 'spec_helper'

describe Enigma::Rotor do
  let(:rotor) do
    Rotor.new "A" => "B", "T" => "A", "X" => "B", "Y" => "Q"
  end

  describe '#transform_forward' do
    context 'when rotor position is "A"' do
      before { rotor.rotate_to 'A' }

      it 'transforms according to encryption map' do
        expect(rotor.transform_forward('X')).to eq('B')
      end
    end

    context 'when rotor position is "B"' do
      before { rotor.rotate_to 'B' }

      it 'takes rotor position into account' do
        expect(rotor.transform_forward('X')).to eq('P')
      end
    end

    context 'when rotor position is "D"' do
      before { rotor.rotate_to 'D' }

      it 'takes rotor position into account' do
        expect(rotor.transform_forward('X')).to eq('Y')
      end
    end

    context 'when rotor position is "W"' do
      before { rotor.rotate_to 'W' }

      it 'takes rotor position into account' do
        expect(rotor.transform_forward('X')).to eq('E')
      end
    end
  end

  describe '#transform_backward' do

  end
end
