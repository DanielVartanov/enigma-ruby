module Enigma
  class Rotor < Struct.new :encryption_map
    def initialize
      self.displacement = 0
    end

    def rotate
      self.displacement = (self.displacement + 1) % 26
    end

    def position
      ('A'.ord + displacement).chr
    end

    protected

    attr_accessor :displacement
  end
end
