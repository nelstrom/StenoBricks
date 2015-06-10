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
  },
  {
    id: 'thumbFirstPath',
    points: [
      'M 100 100',
      'L 150 100',
      'C 150 080',
      '  200 080',
      '  200 100',
      'L 200 300',
      'C 200 360',
      '  100 360',
      '  100 300',
      'z'
    ]
  },
  {
    id: 'thumbSecondPath',
    points: [
      'M 100, 100',
      'C 100, 080',
      '  150, 080',
      '  150, 100',
      'L 200, 100',
      'L 200, 300',
      'C 200, 360',
      '  100, 360',
      '  100, 300',
      'z'
    ]
  },
  {
    id: 'starKeyPath',
    points: [
      'M 100, 100',
      'L 150 100',
      'C 150 080',
      '  250 080',
      '  250 100',
      'L 300 100',
      'L 300 220',
      'C 300 280',
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

thumbs = [
  {
    index: 3.5,
    fill: 'light',
    symbol: '#thumbFirstPath'
  },
  {
    index: 4.5,
    fill: 'dark',
    symbol: '#thumbSecondPath'
  },
  {
    index: 5.5,
    fill: 'dark',
    symbol: '#thumbFirstPath'
  },
  {
    index: 6.5,
    fill: 'light',
    symbol: '#thumbSecondPath'
  },
]

star = {
    index: 4.5,
    fill: 'light',
    symbol: '#starKeyPath'
}

leftBottom = [0,1,2,3].map do |i|
  {
    index: i,
    fill: 'dark',
    symbol: '#bottomRowPath'
  }
end

leftTop = [1,2,3].map do |i|
  {
    index: i,
    fill: 'light',
    symbol: '#topRowPath'
  }
end

rightBottom = [7,8,9,10,11].map do |i|
  {
    index: i,
    fill: 'light',
    symbol: '#bottomRowPath'
  }
end

rightTop = [7,8,9,10,11].map do |i|
  {
    index: i,
    fill: 'dark',
    symbol: '#topRowPath'
  }
end

[thumbs, star, leftBottom, leftTop, rightBottom, rightTop].flatten.each do |button|
  xml.use(
    "xlink:href" => button[:symbol],
    x: button[:index] * 100,
    y: 50,
    class: "stroked #{button[:fill]}Fill"
  )
end
