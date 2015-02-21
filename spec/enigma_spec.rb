require 'spec_helper'

describe Enigma::Enigma do
  let(:rotor1) do
    Rotor.new "A" => "F", "B" => "U", "C" => "J", "D" => "L", "E" => "N", "F" => "M", "G" => "E",
      "H" => "S", "I" => "A", "J" => "O", "K" => "I", "L" => "B", "M" => "W", "N" => "Q",
      "O" => "P", "P" => "H", "Q" => "G", "R" => "R", "S" => "Z", "T" => "D", "U" => "C",
      "V" => "V", "W" => "Y", "X" => "K", "Y" => "X", "Z" => "T"
  end

  let(:rotor2) do
    Rotor.new "A" => "X", "B" => "D", "C" => "H", "D" => "T", "E" => "O", "F" => "W",
      "G" => "R","H" => "J", "I" => "E", "J" => "P", "K" => "A", "L" => "B", "M" => "I",
      "N" => "Y","O" => "L", "P" => "C", "Q" => "F", "R" => "U", "S" => "G", "T" => "M",
      "U" => "V","V" => "N", "W" => "S", "X" => "Q", "Y" => "K", "Z" => "Z"
  end

  let(:rotor3) do
    Rotor.new "A" => "V", "B" => "E", "C" => "D", "D" => "Z", "E" => "U", "F" => "Y", "G" => "L",
      "H" => "P", "I" => "Q", "J" => "S", "K" => "O", "L" => "K", "M" => "F", "N" => "H",
      "O" => "R", "P" => "C", "Q" => "X", "R" => "W", "S" => "J", "T" => "N", "U" => "M",
      "V" => "I", "W" => "G", "X" => "B", "Y" => "A", "Z" => "T"
  end

  let(:reflector) do
    Reflector.new ["A", "R"], ["B", "X"], ["C", "Z"], ["D", "S"],
      ["E", "N"], ["F", "V"], ["G", "U"], ["H", "Y"], ["I", "T"],
      ["J", "W"], ["K", "Q"], ["L", "P"], ["M", "O"]
  end

  let(:rotor_deck) { RotorDeck.new rotors: [rotor1, rotor2, rotor3], reflector: reflector }

  let(:enigma) { Enigma::Enigma.new rotor_deck: rotor_deck }

  before { engima.rotate_rotors_to 'AAA' }

  describe '#type_in' do
    context 'when I input decrypted message' do
      it 'encrypts the message' do
        expect(enigma.type_in('PZD')).to eq('BEC')
      end
    end

    context 'when I input encrypted message' do
      it 'decrypts the message' do
        expect(enigma.type_in('BEC')).to eq('PZD')
      end
    end
  end
end
