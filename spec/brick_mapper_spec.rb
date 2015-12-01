require 'rspec'
require_relative '../lib/brick_mapper'

describe BrickMapper do

  let(:bricks) do
    [
      {
        id: "short-a",
        letter: "A",
        keystrokes: [8]
      },
      {
        id: "short-e",
        letter: "E",
        keystrokes: [11]
      },
      {
        id: "start-b",
        letter: "B",
        keystrokes: [4,5]
      },
      {
        id: "start-k",
        letter: "K",
        keystrokes: [3]
      },
      {
        id: "end-r",
        letter: "R",
        keystrokes: [14]
      },
      {
        id: "end-n",
        letter: "N",
        keystrokes: [15, 16]
      },
      {
        id: "end-t",
        letter: "T",
        keystrokes: [19]
      },
      {
        id: "end-th",
        letter: "TH",
        keystrokes: [10, 19]
      }
    ]
  end

  let(:mapper) { BrickMapper.new(bricks) }

  let(:car) do
    {
      word: "car",
      bricks: [
        "start-k",
        "short-a",
        "end-r"
      ]
    }
  end

  let(:bar) do
    {
      word: "bar",
      bricks: [
        "start-b",
        "short-a",
        "end-r"
      ]
    }
  end

  let(:earth) do
    {
      word: "earth",
      bricks: [
        "short-e",
        "end-r",
        "end-th",
      ]
    }
  end

  let(:the) do
    {
      word: "the",
      bricks: [
        "end-t"
      ]
    }
  end

  let(:about) do
    {
      word: "about",
      bricks: [
        "start-b"
      ]
    }
  end

  let(:been) do
    {
      word: "been",
      bricks: [
        "start-b",
        "end-n",
      ]
    }
  end

  context 'definitions with a vowel (or star)' do
    it "converts 'car' to kar" do
      expect(mapper.lookup(car[:bricks])).to eql('kar')
    end

    it "converts 'bar' to pwar" do
      expect(mapper.lookup(bar[:bricks])).to eql('pwar')
    end

    it "converts 'earth' to *ert" do
      expect(mapper.lookup(earth[:bricks])).to eql('*ert')
    end
  end

  context 'definitions with no vowel (or star)' do
    it "converts 'about' to 'PW'" do
      expect(mapper.lookup(about[:bricks])).to eql('pw')
    end

    it "converts 'the' to '-T'" do
      expect(mapper.lookup(the[:bricks])).to eql('-t')
    end

    it "converts 'been' to 'PW-PB'" do
      expect(mapper.lookup(been[:bricks])).to eql('pw-pb')
    end
  end

  it "blows up when looking up a word defined with a non-existant brick" do
    zen = {
      word: "zen",
      bricks: [
        "start-z", # undefined brick
        "short-e",
        "end-n",
      ]
    }
    expect{ mapper.lookup(zen) }.to raise_exception
  end

  it "turns supplied bricks into a hash" do
    expect(mapper.brickset).to eql({
      "short-a" => [8],
      "short-e" => [11],
      "start-b" => [4,5],
      "start-k" => [3],
      "end-r"   => [14],
      "end-n"   => [15, 16],
      "end-t"   => [19],
      "end-th"  => [10, 19],
    })
  end
end
