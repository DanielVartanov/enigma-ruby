require 'spec_helper'

describe RotorDeck do
  let(:left_rotor) { Rotor.new nil }
  let(:middle_rotor) { Rotor.new nil }
  let(:right_rotor) { Rotor.new nil }

  let(:rotor_deck) { RotorDeck.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: nil }

  describe '#position' do
    before do
      left_rotor.rotate_to 'H'
      middle_rotor.rotate_to 'U'
      right_rotor.rotate_to 'Y'
    end

    it 'combines positions of all rotors in the deck' do
      expect(rotor_deck.position).to eq('HUY')
    end
  end
end
