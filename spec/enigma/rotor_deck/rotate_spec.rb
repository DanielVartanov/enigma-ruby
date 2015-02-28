require 'spec_helper'

describe Enigma::RotorDeck do
  let(:left_rotor) { Rotor.new nil }
  let(:middle_rotor) { Rotor.new nil }
  let(:right_rotor) { Rotor.new nil }

  let(:rotor_deck) { RotorDeck.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: nil }

  describe '#rotate' do
    context 'when position is AAA' do
      before { rotor_deck.rotate_to 'AAA' }

      it 'rotates the rightmost rotor only' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'AAB'
      end
    end

    context 'when position is AAY' do
      before { rotor_deck.rotate_to 'AAY' }

      it 'rotates the rightmost rotor only' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'AAZ'
      end
    end

    context 'when position is WXY' do
      before { rotor_deck.rotate_to 'WXY' }

      it 'rotates rightmost and middle rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'WXZ'
      end
    end

    context 'when position is AAZ' do
      before { rotor_deck.rotate_to 'AAZ' }

      it 'rotates rightmost and middle rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'ABA'
      end
    end

    context 'when position is AYZ' do
      before { rotor_deck.rotate_to 'AYZ' }

      it 'rotates rightmost and middle rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'AZA'
      end
    end

    context 'when position is AZZ' do
      before { rotor_deck.rotate_to 'AZZ' }

      it 'rotates all three rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'BAA'
      end
    end

    context 'when position is YZZ' do
      before { rotor_deck.rotate_to 'YZZ' }

      it 'rotates all three rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'ZAA'
      end
    end

    context 'when position is ZZZ' do
      before { rotor_deck.rotate_to 'ZZZ' }

      it 'rotates all three rotors' do
        expect { rotor_deck.rotate }.to change { rotor_deck.position }.to 'AAA'
      end
    end
  end
end
