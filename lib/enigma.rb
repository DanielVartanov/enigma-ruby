require 'enigma/rotor'
require 'enigma/reflector'
require 'enigma/rotor_deck'
require 'enigma/extensions/string/map'
require 'enigma/extensions/string/shift_letter'
require 'enigma/enigma'

String.class_eval do
  include Enigma::Extensions::String::Map
  include Enigma::Extensions::String::ShiftLetter
end
