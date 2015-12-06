require 'rspec'
require_relative '../lib/definition_exploder'

describe NotationMapper do
  describe '#translate' do
    it 'converts "ST" to [1, 2]' do
      expect(NotationMapper.translate('ST')).to eql([1, 2])
    end

    it 'converts "-TS" to [19, 20]' do
      expect(NotationMapper.translate('-TS')).to eql([19, 20])
    end

    it 'converts "STTS" to [1, 2, 19, 20]' do
      expect(NotationMapper.translate('STTS')).to eql([1, 2, 19, 20])
    end

    it 'converts "#STKPWHRAO*EUFRPBLGTSDZ" to [0, 1, 2, ..., 22]' do
      expect(NotationMapper.translate('#STKPWHRAO*EUFRPBLGTSDZ')).to eql((0..22).to_a)
    end

    [
      ['S', 1, 20],
      ['T', 2, 19],
      ['R', 7, 14],
      ['P', 4, 15],
    ].each do |letter, left, right|
      it 'treats "#{letter}" and "-#{letter}" differently' do
        expect(NotationMapper.translate("#{letter}")).to eql([left])
        expect(NotationMapper.translate("-#{letter}")).to eql([right])
      end
    end

    [
      ['F', 13],
      ['B', 16],
      ['L', 17],
      ['G', 18],
      ['D', 21],
      ['Z', 22],
    ].each do |letter, index|
      it 'treats "#{letter}" and "-#{letter}" the same' do
        expect(NotationMapper.translate("#{letter}")).to eql([index])
        expect(NotationMapper.translate("-#{letter}")).to eql([index])
      end
    end

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
