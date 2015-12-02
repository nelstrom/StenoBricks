---
layout: svg
title: Steno Bricks Diagram
---

definition.chords.each_with_index do |chord, index|
  xml.g(:class => 'definition-chord', :transform => "translate(0 #{bounds.offset_for_chord(index)})") do
    [chord.foundation, chord.overlay].flatten.each do |brick|
      xml << partial('brick', locals: {brick: brick})
    end
  end
end
