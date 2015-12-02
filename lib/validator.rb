class Validator
  def initialize(data)
    @bricks = data['bricks']
    @definitions = data['definitions']
  end

  def brick_ids
    @bricks.map { |b| b['id'] }
  end

  def used_bricks
    @definitions.flat_map { |definition|
      definition['strokes'] ||= [
        { 'bricks' => definition['bricks'] }
      ]
      definition['strokes'].flat_map { |stroke| stroke['bricks'] }
    }.compact.uniq
  end

  def undefined_bricks
    used_bricks - brick_ids
  end

  def valid?
    undefined_bricks.empty?
  end
end
