var draw = SVG('drawing').size(300, 300);

var points = [
  'M 100, 100',  // top left
  // top bump
  'L 150, 100',
  'L 155, 090',
  'L 175, 088',
  'L 195, 090',
  'L 200, 100',  // top right
  'L 200, 200',  // bottom right
  'L 100, 200',  // bottom left
  'z'          // close path (back to top left)
];

var shape = draw.path(points.join(','))
  .stroke({ color: '#333', width: 2 })
  .fill('#eee');
