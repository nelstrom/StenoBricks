require 'rspec'
require_relative '../lib/brick_mapper'

describe BrickMapper do

  let(:brickset) do
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

  let(:mapper) { BrickMapper.new(brickset) }

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

  it "converts simple 'car' definition to kar" do
    expect(mapper.lookup(car)).to eql('kar')
  end

  it "converts simple 'bar' definition to pwar" do
    expect(mapper.lookup(bar)).to eql('pwar')
  end
end
