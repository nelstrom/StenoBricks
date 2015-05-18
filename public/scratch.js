var draw = SVG('drawing').size(300, 300);

var points = [
  'M100,100',
  'L200,100',
  'L200,200',
  'L100,200',
  'z'
];

var shape = draw.path(points.join(','))
  .stroke({ color: '#333', width: 2 })
  .fill('#eee');
