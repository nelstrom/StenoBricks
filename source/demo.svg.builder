---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

StenoBrickKit::symbols.each do |s|
  xml.symbol(:id => s[:id]) do
    xml.path(:d => s[:points].map(&:strip).join(' '))
  end
end


StenoBrickKit::buttons.each do |button|
  xml.use(
    "xlink:href" => button[:symbol],
    :x => button[:offset] * 100,
    :y => 50,
    :class => "stroked #{button[:fill]}Fill"
  )
end


