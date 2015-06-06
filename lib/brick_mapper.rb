class BrickMapper
  KEY_LABELS = %w(# s t k p w h r a o * e u f r p b l g t s d z)
  #               0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2
  #                                  10                  20

  def initialize(brickset)
    @brickset = brickset
  end

  def lookup(definition)
    'kar'
  end
end
