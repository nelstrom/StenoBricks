---
layout: svg
viewBox: "0 0 1000 1000"
---

topRowPoints = [
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
].map(&:strip).join(' ')

xml.symbol(id: 'topRowPath') do
  xml.path(d: topRowPoints)
end

[100, 200, 300].each do |offset|
  xml.use(
    "xlink:href" => '#topRowPath',
    x: offset,
    y: 50,
    class: "stroked lightFill"
  )
end
