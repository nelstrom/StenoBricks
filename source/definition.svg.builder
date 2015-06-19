---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

Steno::Chord.new(bricks).bricks.each do |brick|
  xml << partial('brick', locals: {brick: brick})
end
