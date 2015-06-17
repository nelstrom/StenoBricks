require 'rspec'
require_relative '../lib/steno_brick_kit'

describe StenoBrickKit do
  it 'symbols' do
    it 'returns a list' do
      expect(StenoBrickKit.symbols.class to eql(Array))
    end
  end
end
