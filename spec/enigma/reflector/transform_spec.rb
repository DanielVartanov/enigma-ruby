require 'spec_helper'

describe Reflector do
  let(:reflector) { Reflector.new ["A", "R"], ["B", "X"] }

  describe '#transform' do
    it 'transform forward' do
      expect(reflector.transform('A')).to eq('R')
      expect(reflector.transform('B')).to eq('X')
    end

    it 'transforms backward' do
      expect(reflector.transform('R')).to eq('A')
      expect(reflector.transform('X')).to eq('B')
    end
  end
end
