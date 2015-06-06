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

  context 'definitions with a vowel (or star)' do
    it "converts 'car' to kar" do
      expect(mapper.lookup(car)).to eql('kar')
    end

    it "converts 'bar' to pwar" do
      expect(mapper.lookup(bar)).to eql('pwar')
    end
  end

  it "turns supplied bricks into a hash" do
    expect(mapper.brickset).to eql({
      "short-a" => [8],
      "start-b" => [4,5],
      "start-k" => [3],
      "end-r"   => [14],
    })
  end
end
