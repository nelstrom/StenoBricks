module NotationMapper
  KEY_LABELS = %w(# s t k p w h r a o * e u f r p b l g t s d z)
  #               0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2
  #                                  10                  20

  def self.translate(notation)
    left, right = notation.downcase.split('-')

    numerals = [
      lookup(left.to_s.chars),
      lookup(right.to_s.chars, 10)
    ].flatten

    if numerals.length == notation.sub('-', '').length
      return numerals
    else
      raise "Can't parse notation: '#{notation}'"
    end
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

class BrickSignatureMap
  def initialize(bricks)
    bricks = bricks.map { |b| OpenStruct.new(b) }
    @dictionary = bricks.each_with_object({}) do |brick, hash|
      hash[brick.keystrokes] ||= []
      hash[brick.keystrokes] << brick
    end
  end

  def lookup(signature)
    @dictionary[signature]
  end
end

class DefinitionExploder
  attr_reader :brickset

  def initialize(bricks)
    @signatures = BrickSignatureMap.new(bricks)
  end

  def explode(notation)
    matches = []
    signature = NotationMapper.translate(notation)
    portions = signature.size.downto(1).map { |s| signature.combination(s).entries }
    break_from_portion = false
    portions.each do |portion|
      portion.each do |combination|
        if match = @signatures.lookup(combination)
          matches << match
          break_from_portion = true
        end
      end
      break if break_from_portion
    end
    matches
  end
end

module Mux
  def self.zip(input)
    target_size = input.map(&:size).inject(1, :*)
    filled = input.map { |i| i.cycle(target_size / i.size).to_a }
    filled.first.zip(*filled.drop(1)).uniq
  end
end

class Array
  def groupings
    size.downto(1).flat_map { |s|
      combination(s).to_a.inject([]) { |list, c|
        remainder = self - c
        if remainder.empty?
          list << [c]
        else
          if c.first < remainder.first
            remainder.groupings.flat_map { |g|
              list << [c] + g
            }
          end
        end
        list
      }
    }
  end
end
