class DiagramBounds
  BASE_WIDTH  = 1350
  BASE_HEIGHT = 500
  CHORD_HEIGHT = 100

  def initialize(definition=nil)
    @chord_count = 1
    if definition
      @chord_count = definition.chords.count
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
    CHORD_HEIGHT * (@chord_count-1)
  end
end
