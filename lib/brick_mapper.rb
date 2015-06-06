class BrickMapper
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
    definition.fetch(:bricks).map { |brick|
      brickset[brick]
    }.flatten.map { |keystroke|
      KEY_LABELS[keystroke]
    }.join
  end
end
