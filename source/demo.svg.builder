---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1000 1000"
---

  symbols = [
    {
      id: 'topRowPath',
      points: [
        'M 100 100',

        'C 100 080',
        '  150 080',
        '  150 100',

        'L 200 100',

        'L 200 150',
        'C 200 210',
        '  100 210',
        '  100 150',
        'z'
      ]
    },
    {
      id: 'bottomRowPath',
      points: [
        'M 100 100',
        'L 150 100',

        'C 150 080',
        '  200 080',
        '  200 100',

        'L 200 220',
        'C 200 280',
        '  100 280',
        '  100 220',
        'z'
      ]
    }
]

symbols.each do |s|
  xml.symbol(id: s[:id]) do
    xml.path(d: s[:points].map(&:strip).join(' '))
  end
end

[0, 100, 200, 300].each do |offset|
  xml.use(
    "xlink:href" => '#bottomRowPath',
    x: offset,
    y: 50,
    class: "stroked darkFill"
  )
end

[100, 200, 300].each do |offset|
  xml.use(
    "xlink:href" => '#topRowPath',
    x: offset,
    y: 50,
    class: "stroked lightFill"
  )
end
