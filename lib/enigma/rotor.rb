module Enigma
  class Rotor
    def initialize(encryption_map)
      self.displacement = 0
      self.encryption_map = encryption_map
    end

    def rotate
      self.displacement = (self.displacement + 1) % 26
    end

    def position
      'A'.shift_letter_by(displacement)
    end

    def rotate_to(position)
      self.displacement = position.ord - 'A'.ord
    end

    def transform_forward(letter)
      letter = letter.shift_letter_by(displacement)
      letter = encryption_map[letter]
      letter = letter.shift_letter_by(-displacement)
    end

    protected

    attr_accessor :displacement
    attr_accessor :encryption_map
  end
end
