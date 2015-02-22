module Enigma
  class Enigma
    def initialize(rotors:, reflector:)
      self.rotor_deck = RotorDeck.new rotors: rotors, reflector: reflector
    end

    def type_in(message)
      message.map do |letter|
        rotor_deck.rotate
        rotor_deck.transform(letter)
      end
    end

    def rotate_rotors_to(position)
      rotor_deck.rotate_to position
    end

    protected

    attr_accessor :rotor_deck
  end
end
