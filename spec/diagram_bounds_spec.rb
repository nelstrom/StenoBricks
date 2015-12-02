require 'rspec'
require_relative '../lib/diagram_bounds'

describe DiagramBounds do

  context 'default bounds' do
    subject(:default) { DiagramBounds.new }
    it '#viewBox is "0 0 1350 500"' do
      expect(default.view_box).to eql('0 0 1350 500')
    end
  end

end

