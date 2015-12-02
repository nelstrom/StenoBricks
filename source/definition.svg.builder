---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

definition.chords.each do |chord|
  xml.g(:class => 'definition-chord') do
    [chord.foundation, chord.overlay].flatten.each do |brick|
      xml << partial('brick', locals: {brick: brick})
    end
  end
end
