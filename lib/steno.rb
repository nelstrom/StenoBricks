require 'set'
require 'ostruct'
require_relative './steno_keyboard'

module Steno

  class Brick

    attr_reader :id, :keystrokes, :label

    def initialize(id, label='[no]', keystrokes)
      @id = id
      @label = label
      @keystrokes = keystrokes.sort
    end

    def span
      first = KEY_INFORMATION[keystrokes.first][:left]
      last  = KEY_INFORMATION[keystrokes.last][:right]
      {
        start: first,
        width: (last - first)
      }
    end

    def label_span
      span
    end

    def midpoint
      label_span[:start] + label_span[:width]/2.0
    end

    def is_foundation?
      false
    end

    def span_key_set
      Set.new(keystrokes.first.upto(keystrokes.last))
    end

    def matchers
      keystrokes.map { |index|
        info = KEY_INFORMATION[index]
        {
          start: info[:left],
          width: info[:right] - info[:left],
          shade: info[:shade]
        }
      }
    end

    def eql?(other)
      self.keystrokes == other.keystrokes &&
        self.label == other.label &&
        self.is_foundation? == other.is_foundation?
    end
  end

  class FoundationBrick < Brick
    attr_reader :cover

    def initialize(id, label, keystrokes, cover)
      super(id, label, keystrokes)
      @cover = cover
    end

    def is_foundation?
      true
    end

    def label_span
      first = cover.span[:start] + cover.span[:width]
      last  = KEY_INFORMATION[keystrokes.last][:right]
      {
        start: first,
        width: (last - first)
      }
    end
  end

  class BrickRegistry
    def initialize
      @bricks = {}
    end
    def add(values)
      @bricks[values[:id]] = Brick.new(values[:id], values[:label], values[:keystrokes])
    end
    def lookup(id)
      @bricks.fetch(id)
    end
    def to_s
      "#{super}: #{@bricks.keys.map(&:to_s)}"
    end
  end

  class Chord
    attr_reader :bricks, :notation, :foundation, :overlay
    def initialize(bricks, registry=BrickRegistry.new, mapper=nil)
      bricks = bricks.map { |b|
        if b.class == Brick
          b
        else
          registry.lookup(b)
        end
      }
      @bricks = bricks.sort_by { |b| b.keystrokes.last }
      detect_overlaps
      if mapper
        @notation = mapper.lookup(@bricks.map(&:id))
      end
    end

    def eql?(other)
      @bricks.zip(other.bricks).all? { |mine, yours| mine == yours }
    end

    private

    def detect_overlaps
      @overlay = bricks.reverse.clone
      @foundation = []
      bricks.reverse.each_cons(2) do |one,two|
        if one.span_key_set.intersect?(two.span_key_set)
          @overlay = @overlay - [one]
          @foundation << FoundationBrick.new(one.id, one.label, one.keystrokes, two)
        end
      end
    end
  end

  class Definition
    attr_reader :word, :chords

    def initialize(params)
      params = OpenStruct.new(params)
      @word = params.word

      if params.chords
        @chords = params.chords
      else
        @chords = [params.bricks]
      end
    end
  end

end
