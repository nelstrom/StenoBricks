---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

StenoBrickKit::symbols.each do |s|
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

starButton = {
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

numberButton = {
  index: -0.5,
  fill: 'light',
  symbol: '#numberKeyPath'
}

[
  thumbs,
  leftBottom,
  starButton,
  rightBottom,
  numberButton,
  leftTop,
  rightTop,
].flatten.each do |button|
  xml.use(
    "xlink:href" => button[:symbol],
    x: button[:index] * 100,
    y: 50,
    class: "stroked #{button[:fill]}Fill"
  )
end
