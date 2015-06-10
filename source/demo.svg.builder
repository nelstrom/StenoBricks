---
layout: svg
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
  }
]

symbols.each do |s|
  xml.symbol(id: s[:id]) do
    xml.path(d: s[:points].map(&:strip).join(' '))
  end
end

[100, 200, 300].each do |offset|
  xml.use(
    "xlink:href" => '#topRowPath',
    x: offset,
    y: 50,
    class: "stroked lightFill"
  )
end
