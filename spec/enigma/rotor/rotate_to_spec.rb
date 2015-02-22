require 'spec_helper'

describe Enigma::Rotor do
  let(:rotor) { Rotor.new nil }

  describe '#rotate_to' do
    it 'rotates the rotor directly to the given position' do
      rotor.rotate_to('W')
      expect(rotor.position).to eq('W')

      rotor.rotate_to('C')
      expect(rotor.position).to eq('C')
    end
  end
end
