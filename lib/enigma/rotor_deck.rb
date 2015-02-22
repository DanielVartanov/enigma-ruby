module Enigma
  class RotorDeck
    def initialize(rotors:, reflector:)
      self.left_rotor = rotors[0]
      self.middle_rotor = rotors[1]
      self.right_rotor = rotors[2]
      self.reflector = reflector
    end

    def rotate
      right_rotor.rotate
    end

    def transform(letter)

    end

    def rotate_to(position)

    end

    def position
      rotors.map(&:position).join
    end

    def rotors
      [left_rotor, middle_rotor, right_rotor]
    end

    protected

    attr_accessor :reflector, :left_rotor, :middle_rotor, :right_rotor
  end
end
