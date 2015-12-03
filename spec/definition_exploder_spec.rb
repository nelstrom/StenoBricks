require 'rspec'
require_relative '../lib/definition_exploder'

describe DefinitionExploder do
  let(:bricks) do
    [
      {
        "id": "start-s",
        "label": "S",
        "keystrokes": [1]
      },
      {
        "id": "short-a",
        "label": "A",
        "keystrokes": [8]
      },
      {
        "id": "long-a",
        "label": "AY",
        "keystrokes": [8,11,12]
      },
      {
        "id": "end-f",
        "label": "F",
        "keystrokes": [13]
      },
      {
        "id": "end-v",
        "label": "V",
        "keystrokes": [13]
      }
    ]
  end

  let(:save_notation) { 'SAF' }
  let(:safe_notation) { 'SAEUF' }

  it 'works like this' do
    exploder = DefinitionExploder.new(bricks)
    possibilities = exploder.explode(save_notation)
    expect(possibilities).to eql([
      ["start-s", "short-a", "end-f"],
      ["start-s", "short-a", "end-v"],
    ])
  end
end

describe DefinitionExploder do
  let(:bricks) do
    [
      {
        "id": "start-s",
        "label": "S",
        "keystrokes": [1]
      },
      {
        "id": "short-a",
        "label": "A",
        "keystrokes": [8]
      },
      {
        "id": "long-a",
        "label": "AY",
        "keystrokes": [8,11,12]
      },
      {
        "id": "short-e",
        "label": "E",
        "keystrokes": [11]
      },
      {
        "id": "short-u",
        "label": "U",
        "keystrokes": [12]
      },
      {
        "id": "short-i",
        "label": "I",
        "keystrokes": [11,12]
      },
      {
        "id": "end-f",
        "label": "F",
        "keystrokes": [13]
      },
      {
        "id": "end-v",
        "label": "V",
        "keystrokes": [13]
      }
    ]
  end

  let(:i_notation) { 'EU' }
  let(:save_notation) { 'SAF' }
  let(:safe_notation) { 'SAEUF' }

  # it 'works like this' do
  #   exploder = DefinitionExploder.new(bricks)
  #   possibilities = exploder.explode(i_notation).map{ |p| p["id"] }
  #   expect(possibilities).to eql([
  #     ["short-i"],
  #     ["short-e", "short-u"],
  #   ])
  # end

end
