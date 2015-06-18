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

StenoBrickKit::span_key_symbols.each do |s|
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

  Steno::Chord.new(bricks).bricks.each do |brick|
    xml.g do
      brick.matchers.each do |matcher|
        xml.use(
          "xlink:href" => "#matcher-width-#{matcher[:width]}",
          :x => -50 + matcher[:start] * Dimensions::HORIZONTAL_UNIT/2,
          :y => -40,
          :class => "stroked #{matcher[:shade]}Fill"
        )
      end
      xml.use(
        "xlink:href" => "#span-width-#{brick.span[:width]}",
        :x => -50 + brick.span[:start] * Dimensions::HORIZONTAL_UNIT/2,
        :y => -90,
        :class => "stroked whiteFill"
      )
      xml.text(
        :class => 'buttonLabel',
        :x => -50 + brick.midpoint * Dimensions::HORIZONTAL_UNIT/2,
        :y => 42
      ) do
        xml.tspan(brick.label)
      end
    end
  end
end
