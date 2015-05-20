var white       = '#fff';
var lightfill   = '#eee';
var darkfill    = '#555';
var lightText   = '#999';

var yOffset     =  50;
var draw = SVG('drawing').size(1350, 500);
draw.viewbox(0, 0, 1350, 500);

var topRowPoints = [
  'M 100, 100',  // top left

  // top bump
  'C 100, 080',  // control point 1
  '  150, 080',  // control point 2
  '  150, 100',  // top right

  // top edge
  'L 200, 100',  // top middle

  'L 200, 150',  // bottom right
  'C 200, 210',
  '  100, 210',
  '  100, 150',  // bottom left
  'z'            // close path (back to top left)
];

var bottomRowPoints = [
  'M 100, 100',  // top left

  // top edge
  'L 150, 100',  // top middle

  // top bump
  'C 150, 080',  // control point 1
  '  200, 080',  // control point 2
  '  200, 100',  // top right

  'L 200, 220',  // bottom right
  'C 200, 280',
  '  100, 280',
  '  100, 220',  // bottom left
  'z'            // close path (back to top left)
];

var thumbRowAEPoints = [
  'M 100, 100',  // top left

  // top edge
  'L 150, 100',  // top middle

  // top bump
  'C 150, 080',  // control point 1
  '  200, 080',  // control point 2
  '  200, 100',  // top right

  'L 200, 300',  // bottom right
  'C 200, 360',
  '  100, 360',
  '  100, 300',  // bottom left
  'z'            // close path (back to top left)
];

var thumbRowOUPoints = [
  'M 100, 100',  // top left

  // top bump
  'C 100, 080',  // control point 1
  '  150, 080',  // control point 2
  '  150, 100',  // top right

  // top edge
  'L 200, 100',  // top middle

  'L 200, 300',  // bottom right
  'C 200, 360',
  '  100, 360',
  '  100, 300',  // bottom left
  'z'            // close path (back to top left)
];

var starKeyPoints = [
  'M 100, 100',  // top left

  // top edge
  'L 150, 100',  // top middle

  // top bump
  'C 150, 080',  // control point 1
  '  250, 080',  // control point 2
  '  250, 100',  // top right

  'L 300, 100',  // top middle
  'L 300, 220',  // bottom right
  'C 300, 280',
  '  100, 280',
  '  100, 220',  // bottom left
  'z'            // close path (back to top left)
];

// draw A, E thumb keys
[350, 550].forEach(function(offset) {
  var shade = offset === 350 ? lightfill : darkfill;
  draw.path(thumbRowAEPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(shade);
});

// draw O, U thumb keys
[450, 650].forEach(function(offset) {
  var shade = offset === 650 ? lightfill : darkfill;
  draw.path(thumbRowOUPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(shade);
});

// draw left hand bottom row:
[0, 100, 200, 300].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(darkfill);
});

// draw left hand top row:
[100, 200, 300].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(lightfill);
});

// draw right hand bottom row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(lightfill);
});

// draw right hand top row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .attr('class', 'stroked')
    .fill(darkfill);
});

// draw the star key:
var offset = 450;
draw.path(starKeyPoints.join(','))
  .transform({ x:offset-50, y:yOffset })
  .attr('class', 'stroked')
  .fill(lightfill);

// Add the text labels:
[
  { letter: "#", offset: 70 },

  { letter: "S", offset: 120 },
  { letter: "T", offset: 170 },
  { letter: "K", offset: 220 },
  { letter: "P", offset: 270 },
  { letter: "W", offset: 320 },
  { letter: "H", offset: 370 },
  { letter: "R", offset: 420 },
  { letter: "A", offset: 470 },
  { letter: "O", offset: 520 },

  { letter: "*", offset: 595 },

  { letter: "E", offset: 670 },
  { letter: "U", offset: 720 },
  { letter: "F", offset: 770 },
  { letter: "R", offset: 820 },
  { letter: "P", offset: 870 },
  { letter: "B", offset: 920 },
  { letter: "L", offset: 970 },
  { letter: "G", offset: 1020 },
  { letter: "T", offset: 1070 },
  { letter: "S", offset: 1120 },
  { letter: "D", offset: 1170 },
  { letter: "Z", offset: 1220 },
].forEach(function(plot) {
var text = draw.text(plot.letter)
  .font({
    size: 24,
    anchor: 'middle'
  })
  .fill({ color: lightText})
  .transform({
    x: plot.offset+5,
    y: 42 + yOffset
  });
});

// Draw a blimp
var monoStrokePoints = [
  'M 105, 100',  // top left

  'L 145, 100',  // top right
  'C 151, 110',  // control point 1
  '  151, 140',  // control point 2
  '  145, 150',  // bottom right

  'L 105, 150',  // bottom left
  'C  99, 140',  // control point 1
  '   99, 110',  // control point 2
  '  105, 100',  // bottom right
  'z'            // close path (back to top left)
];

var matcherStrokePoints = [
  'M 105, 100',  // top left

  'L 145, 100',  // top right
  'C 145, 116',  // control point 1
  '  105, 116',  // control point 2
  '  105, 100',  // top left

  'z'            // close path (back to top left)
];

[
  { letter: 'S', offset: 0},
  { letter: 'K', offset: 100 },
  { letter: 'W', offset: 200 },
  { letter: 'R', offset: 300 },
  { letter: 'O', offset: 400 },
  { letter: 'E', offset: 550 },
  { letter: 'F', offset: 650 },
  { letter: 'P', offset: 750 },
  { letter: 'L', offset: 850 },
  { letter: 'T', offset: 950 },
  { letter: 'D', offset: 1050 }
].forEach(function(plot) {
  draw.path(monoStrokePoints.join(','))
    .transform({ x: plot.offset, y: -75 })
    .attr('class', 'stroked')
    .fill(white);

  draw.path(matcherStrokePoints.join(','))
    .transform({ x: plot.offset, y: -25 })
    .attr('class', 'stroked')
    .fill(darkfill);

  draw.text(plot.letter)
    .font({
      size: 24,
      anchor: 'middle'
    })
    .fill({ color: lightText})
    .transform({
      x: plot.offset+125,
      y: yOffset-22
    });

});

[
  { letter: 'T', offset: 50},
  { letter: 'P', offset: 150},
  { letter: 'H', offset: 250},
  { letter: 'A', offset: 350},
  { letter: 'U', offset: 600},
  { letter: 'R', offset: 700},
  { letter: 'B', offset: 800},
  { letter: 'G', offset: 900},
  { letter: 'S', offset: 1000},
  { letter: 'Z', offset: 1100}
].forEach(function(plot) {
  draw.path(monoStrokePoints.join(','))
    .transform({ x: plot.offset, y: -75 })
    .attr('class', 'stroked')
    .fill(white);

  draw.path(matcherStrokePoints.join(','))
    .transform({ x: plot.offset, y: -25 })
    .attr('class', 'stroked')
    .fill(lightfill);

  draw.text(plot.letter)
    .font({
      size: 24,
      anchor: 'middle'
    })
    .fill({ color: lightText})
    .transform({
      x: plot.offset+125,
      y: yOffset-22
    });
});
