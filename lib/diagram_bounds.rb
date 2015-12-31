class DiagramBounds
  BASE_WIDTH  = 1400
  BASE_HEIGHT = 500
  STROKE_HEIGHT = 100

  def initialize(definition=nil)
    @stroke_count = 1
    if definition
      @stroke_count = definition.strokes.count
    end
  end

  def view_box
    [0, 0, width, height].join(' ')
  end

  def width
    BASE_WIDTH
  end

  def height
    BASE_HEIGHT + extra_height
  end

  def extra_height
    STROKE_HEIGHT * (@stroke_count-1)
  end

  def offset_for_stroke(index=0)
    (index*STROKE_HEIGHT) - extra_height
  end
end
