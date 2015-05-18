var draw = SVG('drawing').size(300, 300);

var points = [
  'M100,100',  // top left
  'L200,100',  // top right
  'L200,200',  // bottom right
  'L100,200',  // bottom left
  'z'          // close path (back to top left)
];

var shape = draw.path(points.join(','))
  .stroke({ color: '#333', width: 2 })
  .fill('#eee');
