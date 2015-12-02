require 'rspec'
require_relative '../lib/diagram_bounds'

describe DiagramBounds do

  let(:monostroke_definition) { double("Mono", chords: Array.new(1)) }
  let(:twostroke_definition)  { double("Mono", chords: Array.new(2)) }
  let(:fivestroke_definition) { double("Mono", chords: Array.new(5)) }

  context 'default bounds' do
    subject(:default) { DiagramBounds.new }
    it '#viewBox is "0 0 1350 500"' do
      expect(default.view_box).to eql('0 0 1350 500')
    end
  end

  context 'with a mono-stroke definition' do
    subject(:monostroke_bounds) { DiagramBounds.new(monostroke_definition) }
    it '#viewBox is "0 0 1350 500"' do
      expect(monostroke_bounds.view_box).to eql('0 0 1350 500')
    end
  end

  context 'with a two-stroke definition' do
    subject(:twostroke_bounds) { DiagramBounds.new(twostroke_definition) }
    it '#viewBox is "0 0 1350 600"' do
      expect(twostroke_bounds.view_box).to eql('0 0 1350 600')
    end
  end

  context 'with a five-stroke definition' do
    subject(:fivestroke_bounds) { DiagramBounds.new(fivestroke_definition) }
    it '#viewBox is "0 0 1350 900"' do
      expect(fivestroke_bounds.view_box).to eql('0 0 1350 900')
    end
  end

end
