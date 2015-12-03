xml.g(:class => 'chord-brick') do
  brick.matchers.each do |matcher|
    xml.use(
      "xlink:href" => "#matcher-width-#{matcher[:width]}",
      :x => -50 + matcher[:start] * Dimensions::HORIZONTAL_UNIT/2,
      :y => 0,
      :class => "stroked #{matcher[:shade]}Fill"
    )
  end

  xml.use(
    "xlink:href" => "#span-width-#{brick.span[:width]}",
    :x => -50 + brick.span[:start] * Dimensions::HORIZONTAL_UNIT/2,
    :y => -50,
    :class => "stroked whiteFill"
  )

  xml.text(
    :class => 'buttonLabel',
    :x => -50 + brick.midpoint * Dimensions::HORIZONTAL_UNIT/2,
    :y => 85
  ) do
    xml.tspan(brick.label)
  end
end
