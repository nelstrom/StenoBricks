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

leftBottom = [
  {
    index: 0,
    fill: 'dark',
    symbol: '#bottomRowPath'
  },
  {
    index: 1,
    fill: 'dark',
    symbol: '#bottomRowPath'
  },
  {
    index: 2,
    fill: 'dark',
    symbol: '#bottomRowPath'
  },
  {
    index: 3,
    fill: 'dark',
    symbol: '#bottomRowPath'
  },
]

leftTop = [
  {
    index: 1,
    fill: 'light',
    symbol: '#topRowPath'
  },
  {
    index: 2,
    fill: 'light',
    symbol: '#topRowPath'
  },
  {
    index: 3,
    fill: 'light',
    symbol: '#topRowPath'
  },
]

[leftBottom, leftTop].flatten.each do |button|
  xml.use(
    "xlink:href" => button[:symbol],
    x: button[:index] * 100,
    y: 50,
    class: "stroked #{button[:fill]}Fill"
  )
end
