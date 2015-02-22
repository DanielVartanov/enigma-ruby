module Enigma
  class Reflector
    def initialize(*letter_pairs)
      hash_from_pairs = Hash[*letter_pairs.flatten]
      self.combined_map = hash_from_pairs.merge(hash_from_pairs.invert)
    end

    def transform(letter)
      combined_map[letter]
    end

    protected

    attr_accessor :combined_map
  end
end
