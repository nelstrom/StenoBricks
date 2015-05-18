var draw = SVG('drawing').size(300, 300);

var points = [
  'M 100, 100',  // top left

  // top edge
  'L 150, 100',  // top middle

  // top bump
  'C 150, 080',  // control point 1
  '  200, 080',  // control point 2
  '  200, 100',  // top right

  'L 200, 200',  // bottom right
  'L 100, 200',  // bottom left
  'z'            // close path (back to top left)
];

var shape = draw.path(points.join(','))
  .stroke({ color: '#333', width: 2 })
  .fill('#eee');
