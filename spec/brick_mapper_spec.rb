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
      expect(mapper.lookup(car)).to eql('kar')
    end

    it "converts 'bar' to pwar" do
      expect(mapper.lookup(bar)).to eql('pwar')
    end
  end

  context 'definitions with no vowel (or star)' do
    it "converts 'about' to 'PW'" do
      expect(mapper.lookup(about)).to eql('pw')
    end

    it "converts 'the' to '-T'" do
      expect(mapper.lookup(the)).to eql('-t')
    end

    it "converts 'been' to 'PW-PB'" do
      expect(mapper.lookup(been)).to eql('pw-pb')
    end
  end

  it "turns supplied bricks into a hash" do
    expect(mapper.brickset).to eql({
      "short-a" => [8],
      "start-b" => [4,5],
      "start-k" => [3],
      "end-r"   => [14],
      "end-n"   => [15, 16],
      "end-t"   => [19],
    })
  end
end
