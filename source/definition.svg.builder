---
layout: svg
title: Steno Bricks Diagram
---

definition.strokes.each_with_index do |stroke, index|
  xml.g(:class => 'definition-stroke', :transform => "translate(0 #{bounds.offset_for_stroke(index)})") do
    [stroke.foundation, stroke.overlay].flatten.each do |brick|
      xml << partial('brick', locals: {brick: brick})
    end
  end
end
