---
layout: svg
title: Steno Bricks Diagram
viewBox: "0 0 1350 500"
---

xml << partial('brick', locals: {brick: Steno::Brick.new(brick.id, brick.label, brick.keystrokes)})
