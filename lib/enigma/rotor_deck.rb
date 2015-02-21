module Enigma
  class RotorDeck
    attr_reader :rotors, :reflector

    def initialize(rotors:, reflector:)
      self.rotors = rotors
      self.reflector = reflector
    end

    def rotate
      right_rotor.rotate
    end

    def transform(letter)

    end

    def rotate_to(position)

    end

    protected

    attr_writer :rotors, :reflector

    def left_rotor
      rotors[0]
    end

    def middle_rotor
      rotors[1]
    end

    def right_rotor
      rotors[2]
    end
  end
end
