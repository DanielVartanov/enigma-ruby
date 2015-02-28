require 'spec_helper'

describe Enigma::RotorDeck do
  let(:left_rotor) { Rotor.new nil }
  let(:middle_rotor) { Rotor.new nil }
  let(:right_rotor) { Rotor.new nil }

  let(:rotor_deck) { RotorDeck.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: nil }

  describe '#rotate_to' do
    before { rotor_deck.rotate_to 'XZC' }

    it 'rotates all rotors to given positions' do
      expect(left_rotor.position).to eq('X')
      expect(middle_rotor.position).to eq('Z')
      expect(right_rotor.position).to eq('C')
    end
  end
end
