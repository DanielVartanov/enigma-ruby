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
      letter = right_rotor.transform_forward(letter)
      letter = middle_rotor.transform_forward(letter)
      letter = left_rotor.transform_forward(letter)

      letter = reflector.transform(letter)

      letter = left_rotor.transform_backward(letter)
      letter = middle_rotor.transform_backward(letter)
      letter = right_rotor.transform_backward(letter)
    end

    def rotate_to(position)
      left_rotor.rotate_to position[0]
      middle_rotor.rotate_to position[1]
      right_rotor.rotate_to position[2]
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
