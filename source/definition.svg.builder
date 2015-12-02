---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

definition.chords.each do |chord|

  chord.foundation.each do |brick|
    xml << partial('brick', locals: {brick: brick})
  end

  chord.overlay.each do |brick|
    xml << partial('brick', locals: {brick: brick})
  end

end
