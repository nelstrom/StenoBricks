require 'ostruct'

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
      params = OpenStruct.new(brick)
      hash[params.id] = params.keystrokes
    end
  end

  def lookup(bricks)
    bricks = bricks.map { |b| b.respond_to?(:id) ? b.id : b }
    keyNumbers = bricks_to_numbers(bricks)

    [
      translate(keyNumbers, START),
      translate(keyNumbers, MIDDLE, '-'),
      translate(keyNumbers, FINISH),
    ].join.sub(/-$/, '')
  end

  private

  def translate(numbers, segment = START, replace_blank = nil)
    labels = numbers_to_labels(numbers, segment)
    if labels.empty? and replace_blank
      labels = replace_blank
    end
    labels
  end

  def numbers_to_labels(numbers, segment = START)
    numbers.select { |i| segment.include?(i) }
      .map { |keystroke| KEY_LABELS[keystroke] }
  end

  def bricks_to_numbers(bricks)
    bricks.map { |brick| brickset.fetch(brick) }.flatten.sort
  end

end
