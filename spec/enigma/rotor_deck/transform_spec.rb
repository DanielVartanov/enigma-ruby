require 'spec_helper'

describe Enigma::RotorDeck do
  let(:left_rotor) do
    Rotor.new "A" => "V", "B" => "E", "C" => "D", "D" => "Z", "E" => "U", "F" => "Y", "G" => "L",
      "H" => "P", "I" => "Q", "J" => "S", "K" => "O", "L" => "K", "M" => "F", "N" => "H",
      "O" => "R", "P" => "C", "Q" => "X", "R" => "W", "S" => "J", "T" => "N", "U" => "M",
      "V" => "I", "W" => "G", "X" => "B", "Y" => "A", "Z" => "T"
  end

  let(:middle_rotor) do
    Rotor.new "A" => "X", "B" => "D", "C" => "H", "D" => "T", "E" => "O", "F" => "W",
      "G" => "R","H" => "J", "I" => "E", "J" => "P", "K" => "A", "L" => "B", "M" => "I",
      "N" => "Y","O" => "L", "P" => "C", "Q" => "F", "R" => "U", "S" => "G", "T" => "M",
      "U" => "V","V" => "N", "W" => "S", "X" => "Q", "Y" => "K", "Z" => "Z"
  end

  let(:right_rotor) do
    Rotor.new "A" => "F", "B" => "U", "C" => "J", "D" => "L", "E" => "N", "F" => "M", "G" => "E",
      "H" => "S", "I" => "A", "J" => "O", "K" => "I", "L" => "B", "M" => "W", "N" => "Q",
      "O" => "P", "P" => "H", "Q" => "G", "R" => "R", "S" => "Z", "T" => "D", "U" => "C",
      "V" => "V", "W" => "Y", "X" => "K", "Y" => "X", "Z" => "T"
  end

  let(:reflector) do
    Reflector.new ["A", "R"], ["B", "X"], ["C", "Z"], ["D", "S"],
      ["E", "N"], ["F", "V"], ["G", "U"], ["H", "Y"], ["I", "T"],
      ["J", "W"], ["K", "Q"], ["L", "P"], ["M", "O"]
  end

  let(:rotor_deck) { RotorDeck.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: reflector }

  describe '#transform' do
    context 'when position is AAA' do
      before { rotor_deck.rotate_to 'AAA' }

      it 'transforms a letter according to rotor and reflector configuration' do
        expect(rotor_deck.transform('X')).to eq('Z')
      end

      context 'when position is AAB' do
        before { rotor_deck.rotate_to 'AAB' }

        pending 'takes right rotor position into account' do
          expect(rotor_deck.transform('P')).to eq('B')
        end

        context 'when position is AAD' do
          before { rotor_deck.rotate_to 'AAD' }

          pending 'takes right rotor position into account' do
            expect(rotor_deck.transform('D')).to eq('C')
          end

          context 'when position is BCD' do
            before { rotor_deck.rotate_to 'BCD' }

            it 'takes all rotor positions into account'
          end
        end
      end
    end
  end
end
