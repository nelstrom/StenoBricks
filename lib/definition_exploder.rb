class DefinitionExploder

end

class DefinitionExploder
  attr_reader :brickset

  def initialize(bricks)
    @brickset = bricks.each_with_object({}) do |brick, hash|
      hash[brick[:id]] = brick[:keystrokes]
    end
  end
end
