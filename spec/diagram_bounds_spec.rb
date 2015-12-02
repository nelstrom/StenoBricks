require 'rspec'
require_relative '../lib/diagram_bounds'

describe DiagramBounds do
  it '#viewBox has default values' do
    expect(DiagramBounds.new.view_box).to eql('0 0 1350 500')
  end
end

