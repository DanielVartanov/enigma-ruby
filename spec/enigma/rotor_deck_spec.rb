require 'spec_helper'

describe Enigma::RotorDeck do
  let(:left_rotor) { Rotor.new }
  let(:middle_rotor) { Rotor.new }
  let(:right_rotor) { Rotor.new }

  let(:rotor_deck) { RotorDeck.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: nil }

  before { rotor_deck.rotate_to 'AAA' }

  describe '#rotate' do
    it 'rotates the rightmost rotor' do
      rotor_deck.rotate
      expect(right_rotor.position).to eq('B')
    end
  end
end
