require 'spec_helper'

describe Enigma::Enigma do
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

  let(:enigma) { Enigma::Enigma.new rotors: [left_rotor, middle_rotor, right_rotor], reflector: reflector }

  before { enigma.rotate_rotors_to 'AAA' }

  describe '#type_in' do
    subject { enigma.type_in(message) }

    context 'when message is short' do
      context 'when I input decrypted message' do
        let(:message) { 'PZD' }

        it 'encrypts the message' do
          is_expected.to eq 'BEC'
        end
      end

      context 'when I input encrypted message' do
        let(:message) { 'BEC' }

        it 'decrypts the message' do
          is_expected.to eq 'PZD'
        end
      end
    end

    context 'when message is long (more than 26 letters)' do
      context 'when I input decrypted message' do
        let(:message) { 'ABCDEFGHIJKLMNOPQRSTUVWXYZABC' }

        it 'encrypts the message' do
          is_expected.to eq 'CRDJLGDMARVHPJGWREDOHJCYVEIOM'
        end
      end

      context 'when I input encrypted message' do
        let(:message) { 'CRDJLGDMARVHPJGWREDOHJCYVEIOM' }

        it 'decrypts the message' do
          is_expected.to eq 'ABCDEFGHIJKLMNOPQRSTUVWXYZABC'
        end
      end
    end

    context 'when message is very long (more than 26^2 letters)' do
      let(:alphabet) { ('A'..'Z').to_a.join }

      context 'when I input decrypted message' do
        let(:message) { alphabet * 26 + 'ABC' }

        it 'encrypts the message' do
          expect(subject[-3..-1]).to eq('HGI')
        end
      end
    end
  end
end
