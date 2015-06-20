require 'set'

module Steno
  KEY_INFORMATION = {
    0  => { left:  0, right:  2 },
    1  => { left:  2, right:  3 },
    2  => { left:  3, right:  4 },
    3  => { left:  4, right:  5 },
    4  => { left:  5, right:  6 },
    5  => { left:  6, right:  7 },
    6  => { left:  7, right:  8 },
    7  => { left:  8, right:  9 },
    8  => { left:  9, right: 10 },
    9  => { left: 10, right: 11 },
    10 => { left: 11, right: 13 },
    11 => { left: 13, right: 14 },
    12 => { left: 14, right: 15 },
    13 => { left: 15, right: 16 },
    14 => { left: 16, right: 17 },
    15 => { left: 17, right: 18 },
    16 => { left: 18, right: 19 },
    17 => { left: 19, right: 20 },
    18 => { left: 20, right: 21 },
    19 => { left: 21, right: 22 },
    20 => { left: 22, right: 23 },
    21 => { left: 23, right: 24 },
    22 => { left: 24, right: 25 },
  }

  class Brick

    attr_reader :keystrokes, :label

    def initialize(label='[no]', keystrokes)
      @label = label
      @keystrokes = keystrokes
    end

    def span
      first = KEY_INFORMATION[keystrokes.first][:left]
      last  = KEY_INFORMATION[keystrokes.last][:right]
      {
        start: first,
        width: (last - first)
      }
    end

    def midpoint
      span[:start] + span[:width]/2.0
    end

    def matchers
      keystrokes.map { |index|
        info = KEY_INFORMATION[index]
        {
          start: info[:left],
          width: info[:right] - info[:left],
          shade: index.even? ? 'light' : 'dark'
        }
      }
    end

    def eql?(other)
      self.keystrokes == other.keystrokes && self.label == other.label
    end
  end

  class BrickRegistry
    def initialize
      @bricks = {}
    end
    def add(values)
      @bricks[values[:id]] = Brick.new(values[:label], values[:keystrokes])
    end
    def lookup(id)
      @bricks.fetch(id)
    end
    def to_s
      "#{super}: #{@bricks.keys.map(&:to_s)}"
    end
  end

  class Chord
    attr_reader :bricks, :foundation, :overlay
    def initialize(bricks)
      @bricks = bricks.sort_by { |b| b.keystrokes.last }
      detect_overlaps
    end

    private

    def detect_overlaps
      @foundation = []
      bricks.reverse.each_cons(2) do |one,two|
        set_one = Set.new(one.keystrokes.first.upto(one.keystrokes.last))
        set_two = Set.new(two.keystrokes.first.upto(two.keystrokes.last))
        if set_one.intersect?(set_two)
          @foundation << one
        end
      end
      @overlay = bricks.reverse - @foundation
    end
  end

end
