require 'spec_helper'

describe Enigma::Extensions::String::ShiftLetter do
  before { String.class_eval { include Enigma::Extensions::String::ShiftLetter } }

  context 'when number is positive' do
    it 'shifts letter forward' do
      expect('D'.shift_letter_by(2)).to eq('F')
    end

    context 'when shift goes beyond border of alphabet' do
      it 'encloses alphabet in circle' do
        expect('D'.shift_letter_by(27)).to eq('E')
      end
    end
  end

  context 'when number is negative' do
    it 'shifts letter backward' do
      expect('D'.shift_letter_by(-2)).to eq('B')
    end

    context 'when shift goes beyond border of alphabet' do
      it 'encloses alphabet in circle' do
        expect('D'.shift_letter_by(-6)).to eq('X')
      end
    end
  end
end
