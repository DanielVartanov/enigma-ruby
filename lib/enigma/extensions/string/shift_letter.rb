module Enigma
  module Extensions
    module String
      module ShiftLetter
        ALPHABET_BEGINNING = 'A'.ord

        def shift_letter_by(shift)
          ((self.ord - ALPHABET_BEGINNING + shift) % 26 + ALPHABET_BEGINNING).chr
        end
      end
    end
  end
end
