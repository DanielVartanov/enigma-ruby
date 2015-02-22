module Enigma
  module Extensions
    module String
      module Map
        def map(&block)
          chars.map(&block).join
        end
      end
    end
  end
end
