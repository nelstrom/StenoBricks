require 'rspec'
require_relative '../lib/definition_exploder'

describe DefinitionExploder do
  # "SAF": "save",
  # "SAEUF": "safe",
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

  let(:save_chord) { }

  # xit 'works like this' do
  #   exploder = DefinitionExploder.new(bricks)
  #   possibilities = exploder.explode(save_chord)
  #   expect(possibilities).to eql([
  #     ["start-s", "short-a", "end-f"],
  #     ["start-s", "short-a", "end-v"],
  #   ])
  # end
end
