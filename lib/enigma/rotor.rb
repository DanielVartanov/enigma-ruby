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
      ('A'.ord + displacement).chr
    end

    def rotate_to(position)
      self.displacement = position.ord - 'A'.ord
    end

    protected

    attr_accessor :displacement
    attr_accessor :encryption_map
  end
end
