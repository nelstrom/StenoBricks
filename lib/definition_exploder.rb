module NotationMapper
  KEY_LABELS = %w(# s t k p w h r a o * e u f r p b l g t s d z)
  #               0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2
  #                                  10                  20

  def self.translate(notation)
    left, right = notation.downcase.split('-')

    [
      lookup(left.to_s.chars),
      lookup(right.to_s.chars, 10)
    ].flatten
  end

  def self.lookup(characters, offset=0)
    Array.new.tap do |buttons|
      KEY_LABELS[offset..-1].each_with_index do |button, index|
        if button == characters.first
          buttons << (index + offset)
          characters.shift
        end
      end
    end
  end

end

class DefinitionExploder
  attr_reader :brickset

  def initialize(bricks)
    @brickset = bricks.each_with_object({}) do |brick, hash|
      hash[brick[:id]] = brick[:keystrokes]
    end
  end
end
