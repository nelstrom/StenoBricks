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

  it "converts simple 'car' definition to kar" do
    mapper = BrickMapper.new(brickset)
    expect(mapper.lookup(car)).to eql('kar')
  end
end
