require 'rspec'
require 'validator'

describe Validator do
  let(:start_t) {
    {
      "id" => "start-t",
      "label" => "T",
      "keystrokes" => [2]
    }
  }
  let(:start_w) {
    {
      "id" => "start-w",
      "label" => "W",
      "keystrokes" => [5]
    }
  }
  let(:short_o) {
    {
      "id" => "short-o",
      "label" => "O",
      "keystrokes" => [9]
    }
  }
  let(:end_b) {
    {
      "id" => "end-b",
      "label" => "B",
      "keystrokes" => [16]
    }
  }
  let(:end_g) {
    {
      "id" => "end-g",
      "label" => "G",
      "keystrokes" => [18]
    }
  }

  let(:bricks) { [start_t, start_w, short_o, end_b, end_g] }
  let(:definitions) {[]}

  subject { Validator.new('bricks' => bricks, 'definitions' => definitions) }

  it '#brick_ids' do
    expect(subject.brick_ids).to eql(['start-t', 'start-w', 'short-o', 'end-b', 'end-g'])
  end

  context 'when definitions use only bricks that have been defined' do
    let(:definitions) {[
      {
        "word" => "to",
        "bricks" => [
          "start-t",
          "short-o"
        ]
      },
      {
        "word" => "being",
        "strokes" => [
          { "bricks" => ["end-b"] },
          { "bricks" => ["end-g"] }
        ]
      }
    ]}

    it '#used_bricks returns the bricks used by definitions' do
      expect(subject.used_bricks).to eql(['start-t', 'short-o', 'end-b', 'end-g'])
    end

    it '#undefined_bricks returns []' do
      expect(subject.undefined_bricks).to eql([])
    end

    it '#valid? is true' do
      expect(subject.valid?)
    end
  end

  context 'when definitions use undefined bricks' do
    let(:definitions) {[
      {
        "word" => "too",
        "bricks" => [
          "start-t",
          "long-oo"
        ]
      }
    ]}

    it '#used_bricks returns the bricks used by definitions' do
      expect(subject.used_bricks).to eql(['start-t', 'long-oo'])
    end

    it '#undefined_bricks returns undefined bricks used by definitions' do
      expect(subject.undefined_bricks).to eql(['long-oo'])
    end

    it '#valid? is false' do
      expect(!subject.valid?)
    end
  end

end
