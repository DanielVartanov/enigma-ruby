require 'spec_helper'

describe Enigma::Rotor do
  let(:rotor) do
    Rotor.new "A" => "B", "H" => "P", "O" => "Y", "T" => "A", "U" => "K", "X" => "B", "Y" => "Q"
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
    context 'when rotor position is "A"' do
      before { rotor.rotate_to 'A' }

      it 'transforms according to encryption map' do
        expect(rotor.transform_backward('Q')).to eq('Y')
      end
    end

    context 'when rotor position is "B"' do
      before { rotor.rotate_to 'B' }

      it 'takes rotor position into account' do
        expect(rotor.transform_backward('O')).to eq('G')
      end
    end

    context 'when rotor position is "D"' do
      before { rotor.rotate_to 'D' }

      it 'takes rotor position into account' do
        expect(rotor.transform_backward('H')).to eq('R')
      end
    end

    context 'when rotor position is "W"' do
      before { rotor.rotate_to 'W' }

      it 'takes rotor position into account' do
        expect(rotor.transform_backward('C')).to eq('S')
      end
    end
  end
end
