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

    it 'blows up when provided with invalid notation' do
      expect { NotationMapper.translate('X') }.to raise_exception("Can't parse notation: 'X'")
      expect { NotationMapper.translate('UA') }.to raise_exception("Can't parse notation: 'UA'")
      expect { NotationMapper.translate('-K') }.to raise_exception("Can't parse notation: '-K'")
      expect { NotationMapper.translate('SSS') }.to raise_exception("Can't parse notation: 'SSS'")
    end
  end
end

describe BrickSignatureMap do
  let(:bricks) do
    [
      { "id": "short-e", "label": "E",   "keystrokes": [11] },
      { "id": "short-u", "label": "U",   "keystrokes": [12] },
      { "id": "short-i", "label": "I",   "keystrokes": [11,12] },
      { "id": "end-f",   "label": "F",   "keystrokes": [13] },
      { "id": "end-v",   "label": "V",   "keystrokes": [13] },
      { "id": "end-rch", "label": "RCH", "keystrokes": [13,14,15,16] },
      { "id": "end-nch", "label": "NCH", "keystrokes": [13,14,15,16] }
    ]
  end

  subject(:signatures) { BrickSignatureMap.new(bricks) }

  it 'returns only match for simple cases' do
    expect(signatures.lookup([11]).map(&:id)).to eql(['short-e'])
    expect(signatures.lookup([12]).map(&:id)).to eql(['short-u'])
    expect(signatures.lookup([11, 12]).map(&:id)).to eql(['short-i'])
  end

  it 'returns multiple matches' do
    results = signatures.lookup([13]).map(&:id)
    expect(results).to include('end-f')
    expect(results).to include('end-v')

    results = signatures.lookup([13, 14, 15, 16]).map(&:id)
    expect(results).to include('end-rch')
    expect(results).to include('end-nch')
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
        "id": "start-n",
        "label": "N",
        "keystrokes": [2, 4, 6]
      },
      { id: 'start-t', label: 'T', keystrokes: [2] },
      { id: 'start-p', label: 'P', keystrokes: [4] },
      { id: 'start-h', label: 'H', keystrokes: [6] },
      {
        "id": "short-a",
        "label": "A",
        "keystrokes": [8]
      },
      {
        "id": "short-o",
        "label": "O",
        "keystrokes": [9]
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
      },
      {
        "id": "end-rch",
        "label": "RCH",
        "keystrokes": [13,14,15,16]
      },
      {
        "id": "end-nch",
        "label": "NCH",
        "keystrokes": [13,14,15,16]
      }
    ]
  end

  let(:e_notation) { 'E' }
  let(:i_notation) { 'EU' }
  let(:save_notation) { 'SAF' }
  let(:safe_notation) { 'SAEUF' }
  let(:lurch_notation) { 'HRUFRPB' }
  let(:no_notation) { 'TPHO' }

  subject(:exploder) { DefinitionExploder.new(bricks) }

  it 'returns a single match for "E" notation' do
    expect(exploder.explode(e_notation).first).to eql([
      [OpenStruct.new({id: 'short-e', label: 'E', keystrokes: [11]})]
    ])
  end

  it 'returns dual matches for "EU" notation' do
    result = exploder.explode(i_notation)

    expect(result.first).to eql([
      [OpenStruct.new({id: 'short-i', label: 'I', keystrokes: [11, 12]})]
    ])

    expect(result).to include([
      [
        OpenStruct.new({id: 'short-e', label: 'E', keystrokes: [11]}),
        OpenStruct.new({id: 'short-u', label: 'U', keystrokes: [12]}),
      ]
    ])
  end

  it 'returns multiple matches for "TPHO" notation' do
    result = exploder.explode(no_notation)
    expect(result.first).to eql([
      [
        OpenStruct.new({id: 'start-n', label: 'N', keystrokes: [2,4,6]}),
        OpenStruct.new({id: "short-o", label: "O", keystrokes: [9]})
      ]
    ])

    expect(result).to include([
      [
        OpenStruct.new({id: 'start-t', label: 'T', keystrokes: [2]}),
        OpenStruct.new({id: 'start-p', label: 'P', keystrokes: [4]}),
        OpenStruct.new({id: 'start-h', label: 'H', keystrokes: [6]}),
        OpenStruct.new({id: "short-o", label: "O", keystrokes: [9]})
      ]
    ])
  end

end

describe Mux do
  describe '#zip' do
    let(:one) { ['a'] }
    let(:two) { ['m', 'n'] }
    let(:three) { ['x', 'y', 'z'] }

    it 'given a single array, nests it as the single item in an outer array' do
      expect(Mux.zip(one)).to eql([one])
      expect(Mux.zip(two)).to eql([two])
      expect(Mux.zip(three)).to eql([three])
    end

    it 'combines 1 and 2 element lists' do
      result = Mux.zip([one, two])
      expect(result).to include(['a', 'm'])
      expect(result).to include(['a', 'n'])
    end

    it 'combines 1, 2 and 3 element lists' do
      result = Mux.zip([one, two, three])
      expect(result).to include(['a', 'm', 'x'])
      expect(result).to include(['a', 'm', 'y'])
      expect(result).to include(['a', 'm', 'z'])
      expect(result).to include(['a', 'n', 'x'])
      expect(result).to include(['a', 'n', 'y'])
      expect(result).to include(['a', 'n', 'z'])
    end

    it 'combines 2, 2 and 3 element lists' do
      result = Mux.zip([two, two, three])
      expect(result.size).to eql(6)
    end
  end
end

describe Array do
  describe '#groupings' do
    it 'has one result for array.size => 1' do
      expect(['a'].groupings).to eql([[['a']]])
    end

    it 'has some results for array.size => 2' do
      result = ['a', 'b'].groupings.to_a
      expect(result).to include([['a', 'b']])
      expect(result).to include([['a'], ['b']])
      expect(result).not_to include([['b'], ['a']])
      expect(result.size).to eql(2)
    end

    it 'has some results for array.size => 3' do
      result = ['a', 'b', 'c'].groupings.to_a
      expect(result).to include([['a', 'b', 'c']])
      expect(result).to include([['a', 'b'], ['c']])
      expect(result).to include([['a', 'c'], ['b']])
      expect(result).to include([['a'], ['b', 'c']])
      expect(result).to_not include([['b', 'c'], ['a']])
      expect(result).to include([['a'], ['b'], ['c']])
      expect(result.size).to eql(5)
    end

    it 'has some results for array.size => 4' do
      result = ['a', 'b', 'c', 'd'].groupings.to_a
      expect(result).to include([['a', 'b', 'c', 'd']])
      expect(result).to include([['a', 'b', 'c'], ['d']])
      expect(result).to include([['a', 'b', 'd'], ['c']])
      expect(result).to include([['a', 'c', 'd'], ['b']])
      expect(result).to include([["a", "b"], ["c", "d"]])
      expect(result).to include([["a", "b"], ["c"], ["d"]])
      expect(result).to include([["a", "c"], ["b", "d"]])
      expect(result).to include([["a", "c"], ["b"], ["d"]])
      expect(result).to include([["a", "d"], ["b", "c"]])
      expect(result).to include([["a", "d"], ["b"], ["c"]])
      expect(result).to include([["a"], ["b", "c", "d"]])
    end
  end
end
