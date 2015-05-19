var white       = '#fff';
var lightfill   = '#eee';
var darkfill    = '#555';
var darkstroke  = '#222';

var yOffset     =  50;
var draw = SVG('drawing').size(1350, 500);

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
    .stroke({ color: darkstroke, width: 2 })
    .fill(shade);
});

// draw O, U thumb keys
[450, 650].forEach(function(offset) {
  var shade = offset === 650 ? lightfill : darkfill;
  draw.path(thumbRowOUPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .stroke({ color: darkstroke, width: 2 })
    .fill(shade);
});

// draw left hand bottom row:
[0, 100, 200, 300].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .stroke({ color: darkstroke, width: 2 })
    .fill(darkfill);
});

// draw left hand top row:
[100, 200, 300].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .stroke({ color: darkstroke, width: 2 })
    .fill(lightfill);
});

// draw right hand bottom row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .stroke({ color: darkstroke, width: 2 })
    .fill(lightfill);
});

// draw right hand top row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50, y:yOffset })
    .stroke({ color: darkstroke, width: 2 })
    .fill(darkfill);
});

// draw the star key:
var offset = 450;
draw.path(starKeyPoints.join(','))
  .transform({ x:offset-50, y:yOffset })
  .stroke({ color: darkstroke, width: 2 })
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
    size: 24
  })
  .transform({
    x: plot.offset-3,
    y: 42 + yOffset
  });
});

// Draw a blimp
var monoStrokePoints = [
  'M 105, 100',  // top left

  'L 145, 100',  // top right
  'C 150, 110',  // control point 1
  '  150, 140',  // control point 2
  '  145, 150',  // bottom right

  'L 105, 150',  // bottom left
  'C 100, 140',  // control point 1
  '  100, 110',  // control point 2
  '  105, 100',  // bottom right
  'z'            // close path (back to top left)
];

draw.path(monoStrokePoints.join(','))
  .transform({ x: 0, y: -75 })
  .stroke({ color: darkstroke, width: 1 })
  .fill(white);

var matcherStrokePoints = [
  'M 105, 100',  // top left

  'L 145, 100',  // top right
  'C 145, 116',  // control point 1
  '  105, 116',  // control point 2
  '  105, 100',  // top left

  'z'            // close path (back to top left)
];

draw.path(matcherStrokePoints.join(','))
  .transform({ x: 0, y: -25 })
  .stroke({ color: darkstroke, width: 1 })
  .fill(darkfill);
