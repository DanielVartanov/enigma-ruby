module Enigma
  class Enigma
    attr_reader :rotor_deck

    def initialize(rotor_deck:)
      self.rotor_deck = rotor_deck
    end

    def type_in(message)

    end

    delegate :rotate_rotors_to, to: :rotor_deck

    protected

    attr_writer :rotor_deck
  end
end
