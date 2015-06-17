---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---
load './lib/steno_brick_kit.rb'

StenoBrickKit::symbols.each do |s|
  xml.symbol(:id => s[:id]) do
    xml.path(:d => s[:points].map(&:strip).join(' '))
  end
end

xml.g(:transform => "translate(#{Dimensions::HORIZONTAL_UNIT})") do
  StenoBrickKit::buttons.each do |button|
    xml.use(
      "xlink:href" => button[:symbol],
      :x => button[:offset] * Dimensions::HORIZONTAL_UNIT,
      :y => 50,
      :class => "stroked #{button[:fill]}Fill"
    )
  end

  StenoBrickKit::labels.each do |label|
    add = -25
    if label[:width] == 2
      add = add + Dimensions::HORIZONTAL_UNIT/4
    end

    xml.text(:class => 'buttonLabel', :y => 115, :x => (add + label[:xPosition] * Dimensions::HORIZONTAL_UNIT/2)) do
      xml.tspan(label[:text])
    end
  end
end
