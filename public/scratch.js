var draw = SVG('drawing').size(300, 300);

var rect = draw.rect(100, 100);
rect.fill({ color: '#eee' });
// rect.stroke({ color: '#333', width: 3 });

var circle = draw.circle(100);
circle.fill('#ccc');
circle.transform({
  x: 0,
  y: 50
});

rect.maskWith(circle);
