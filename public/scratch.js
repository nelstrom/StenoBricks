var lightfill   = '#eee';
var darkfill    = '#555';
var darkstroke  = '#222';
var draw = SVG('drawing').size(1350, 300);

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

// draw left hand bottom row:
[0, 100, 200, 300].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50 })
    .stroke({ color: darkstroke, width: 2 })
    .fill(darkfill);
});

// draw left hand top row:
[100, 200, 300].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50 })
    .stroke({ color: darkstroke, width: 2 })
    .fill(lightfill);
});

// draw right hand bottom row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset-50 })
    .stroke({ color: darkstroke, width: 2 })
    .fill(lightfill);
});

// draw right hand top row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset-50 })
    .stroke({ color: darkstroke, width: 2 })
    .fill(darkfill);
});
