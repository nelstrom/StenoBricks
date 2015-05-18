var lightfill   = '#eee';
var darkfill    = '#555';
var darkstroke  = '#222';
var draw = SVG('drawing').size(500, 300);

var bottomRowPoints = [
  'M 100, 100',  // top left

  // top edge
  'L 150, 100',  // top middle

  // top bump
  'C 150, 080',  // control point 1
  '  200, 080',  // control point 2
  '  200, 100',  // top right

  'L 200, 150',  // bottom right
  'C 200, 210',
  '  100, 210',
  '  100, 150',  // bottom left
  'z'            // close path (back to top left)
];

var shape = draw.path(bottomRowPoints.join(','))
  .stroke({ color: darkstroke, width: 2 })
  .fill(darkfill);

var shape = draw.path(bottomRowPoints.join(','))
  .transform({
    x:100,
    y:0
  })
  .stroke({ color: darkstroke, width: 2 })
  .fill(lightfill);
