class BrickMapper
  START  = (0..7).to_a
  MIDDLE = (8..12).to_a
  FINISH = (13..23).to_a
  KEY_LABELS = %w(# s t k p w h r a o * e u f r p b l g t s d z)
  #               0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2
  #                                  10                  20

  attr_reader :brickset

  def initialize(bricks)
    @brickset = bricks.each_with_object({}) do |brick, hash|
      hash[brick[:id]] = brick[:keystrokes]
    end
  end

  def lookup(definition)
    keyNumbers = definition.fetch(:bricks).map { |brick|
      brickset[brick]
    }.flatten

    startKeys = keyNumbers.select { |i| START.include?(i) }
    middleKeys = keyNumbers.select { |i| MIDDLE.include?(i) }
    finishKeys = keyNumbers.select { |i| FINISH.include?(i) }

    startLabels = startKeys.map { |keystroke|
      KEY_LABELS[keystroke]
    }
    middleLabels = middleKeys.map { |keystroke|
      KEY_LABELS[keystroke]
    }
    finishLabels = finishKeys.map { |keystroke|
      KEY_LABELS[keystroke]
    }
    middleLabels = '-' if middleLabels.length == 0
    [startLabels, middleLabels, finishLabels].join
  end

end
