var showMonoStrokes = false;
var showDiStroke = false;
var lightText   = '#999';

var yOffset     =  50;
var draw = SVG('drawing').viewbox(0, 0, 1350, 500);

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

var numberKeyPoints = [
  'M 100, 100',  // top left

  // top bump
  'C 100, 080',  // control point 1
  '  200, 080',  // control point 2
  '  200, 100',  // top right

  'L 200, 150',  // bottom right
  'C 200, 210',
  '  100, 210',
  '  100, 150',  // bottom left
  'z'            // close path (back to top left)
];

// draw A, E thumb keys
[350, 550].forEach(function(offset) {
  var shade = offset === 350 ? 'lightFill' : 'darkFill';
  draw.path(thumbRowAEPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked ' + shade);
});

// draw O, U thumb keys
[450, 650].forEach(function(offset) {
  var shade = offset === 650 ? 'lightFill' : 'darkFill';
  draw.path(thumbRowOUPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked ' + shade);
});

// draw left hand bottom row:
[0, 100, 200, 300].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked darkFill');
});

// draw left hand top row:
[100, 200, 300].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked lightFill');
});

// draw right hand bottom row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(bottomRowPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked lightFill');
});

// draw right hand top row:
[700,800,900,1000,1100].forEach(function(offset) {
  draw.path(topRowPoints.join(','))
    .transform({ x:offset, y:yOffset })
    .attr('class', 'stroked darkFill');
});

// draw the star key:
var offset = 450;
draw.path(starKeyPoints.join(','))
  .transform({ x:offset, y:yOffset })
  .attr('class', 'stroked lightFill');

// draw the number key:
var offset = 450;
draw.path(numberKeyPoints.join(','))
  .transform({ x:-50, y:yOffset })
  .attr('class', 'stroked lightFill');

// Add the text labels:
[
  { letter: "#", offset: 95 },

  { letter: "S", offset: 170 },
  { letter: "T", offset: 220 },
  { letter: "K", offset: 270 },
  { letter: "P", offset: 320 },
  { letter: "W", offset: 370 },
  { letter: "H", offset: 420 },
  { letter: "R", offset: 470 },
  { letter: "A", offset: 520 },
  { letter: "O", offset: 570 },

  { letter: "*", offset: 645 },

  { letter: "E", offset: 720 },
  { letter: "U", offset: 770 },
  { letter: "F", offset: 820 },
  { letter: "R", offset: 870 },
  { letter: "P", offset: 920 },
  { letter: "B", offset: 970 },
  { letter: "L", offset: 1020 },
  { letter: "G", offset: 1070 },
  { letter: "T", offset: 1120 },
  { letter: "S", offset: 1170 },
  { letter: "D", offset: 1220 },
  { letter: "Z", offset: 1270 },
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

if (showMonoStrokes) {
  [
    { letter: 'S', offset: 50},
    { letter: 'K', offset: 150 },
    { letter: 'W', offset: 250 },
    { letter: 'R', offset: 350 },
    { letter: 'O', offset: 450 },
    { letter: 'E', offset: 600 },
    { letter: 'F', offset: 700 },
    { letter: 'P', offset: 800 },
    { letter: 'L', offset: 900 },
    { letter: 'T', offset: 1000 },
    { letter: 'D', offset: 1100 }
  ].forEach(function(plot) {
    draw.path(monoStrokePoints.join(','))
      .transform({ x: plot.offset, y: -75 })
      .attr('class', 'stroked whiteFill');

    draw.path(matcherStrokePoints.join(','))
      .transform({ x: plot.offset, y: -25 })
      .attr('class', 'stroked darkFill');

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
    { letter: 'T', offset: 100},
    { letter: 'P', offset: 200},
    { letter: 'H', offset: 300},
    { letter: 'A', offset: 400},
    { letter: 'U', offset: 650},
    { letter: 'R', offset: 750},
    { letter: 'B', offset: 850},
    { letter: 'G', offset: 950},
    { letter: 'S', offset: 1050},
    { letter: 'Z', offset: 1150}
  ].forEach(function(plot) {
    draw.path(monoStrokePoints.join(','))
      .transform({ x: plot.offset, y: -75 })
      .attr('class', 'stroked whiteFill');

    draw.path(matcherStrokePoints.join(','))
      .transform({ x: plot.offset, y: -25 })
      .attr('class', 'stroked lightFill');

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
}

if (showDiStroke) {
  var spanTwoStrokePoints = [
    'M 105, 100',  // top left

    'L 195, 100',  // top right
    'C 201, 110',  // control point 1
    '  201, 140',  // control point 2
    '  195, 150',  // bottom right

    'L 105, 150',  // bottom left
    'C  99, 140',  // control point 1
    '   99, 110',  // control point 2
    '  105, 100',  // bottom right
    'z'            // close path (back to top left)
  ];

  var spanTwoKeys = draw.symbol();
  spanTwoKeys.path(spanTwoStrokePoints.join(','))
    .attr('class', 'stroked whiteFill');
  spanTwoKeys.path(matcherStrokePoints.join(','))
    .transform({ x: 0, y: 50 })
    .attr('class', 'stroked darkFill');
  spanTwoKeys.path(matcherStrokePoints.join(','))
    .transform({ x: 50, y: 50 })
    .attr('class', 'stroked lightFill');
  spanTwoKeys.text("i")
    .font({
      size: 24,
      anchor: 'middle'
    })
    .fill({ color: lightText})
    .transform({
      x: 150,
      y: 100
    });

  draw.use(spanTwoKeys).move(600, -75);
}

var keyInformation = {
   0: { left:  0, right:  2 },
   1: { left:  2, right:  3 },
   2: { left:  3, right:  4 },
   3: { left:  4, right:  5 },
   4: { left:  5, right:  6 },
   5: { left:  6, right:  7 },
   6: { left:  7, right:  8 },
   7: { left:  8, right:  9 },
   8: { left:  9, right: 10 },
   9: { left: 10, right: 11 },
  10: { left: 11, right: 13 },
  11: { left: 13, right: 14 },
  12: { left: 14, right: 15 },
  13: { left: 15, right: 16 },
  14: { left: 16, right: 17 },
  15: { left: 17, right: 18 },
  16: { left: 18, right: 19 },
  17: { left: 19, right: 20 },
  18: { left: 20, right: 21 },
  19: { left: 21, right: 22 },
  20: { left: 22, right: 23 },
  21: { left: 23, right: 24 },
  22: { left: 24, right: 25 },
};

function drawMatcherPoints(positionList) {
  var matcherStrokePoints = [
    'M 105, 100',  // top left
    'L 145, 100',  // top right
    'C 145, 116',  // control point 1
    '  105, 116',  // control point 2
    '  105, 100',  // top left
    'z'            // close path (back to top left)
  ];

  positionList.forEach(function(position) {
    var fillShade = (position % 2 !== 0) ? 'darkFill' : 'lightFill';

    var keyInfo = keyInformation[position];
    var xOffset = keyInfo.left * 50 - 50;

    var width = keyInfo.right - keyInfo.left;
    var rightEdge = 95 + (width * 50);
    var pathPoints = [
      'M 105, 100',  // top left
      'L '+rightEdge+', 100',      // top right
      'C '+rightEdge+', 116',  // control point 1
      '  105, 116',  // control point 2
      '  105, 100',  // top left
      'z'            // close path (back to top left)
    ].join(',');

    draw.path(pathPoints)
      .transform({
        x: xOffset,
        y: -25
      })
      .attr('class', 'stroked ' + fillShade);
  });
}

// drawMatcherPoints([0,1,2,3,4,5,6,7,8,9]);
// drawMatcherPoints([10]);
// drawMatcherPoints([11,12,13,14,15,16,17,18,19,20,21,22]);

function spanKeys(keyList) {
  var first = keyInformation[keyList[0]];
  var last  = keyInformation[keyList[keyList.length-1]];
  var width = last.right - first.left;
  var xOffset = first.left * 50 - 50;
  var rightEdge = 95 + (width * 50);
  var shapePath = [
    'M 105, 100',  // top left

    'L '+rightEdge+', 100',      // top right
    'C '+(rightEdge+6)+', 110',  // control point 1
    '  '+(rightEdge+6)+', 140',  // control point 2
    '  '+rightEdge+', 150',      // bottom right

    'L 105, 150',  // bottom left
    'C  99, 140',  // control point 1
    '   99, 110',  // control point 2
    '  105, 100',  // bottom right
    'z'            // close path (back to top left)
  ];
  draw.path(shapePath.join(','))
    .attr('class', 'stroked whiteFill')
    .transform({ x:xOffset, y:-75 });
}

// spanKeys([0,3]);
// spanKeys([6, 7]);
// spanKeys([9, 11, 12]);
// spanKeys([10, 19]);

function drawStroke(letter, keyList) {
  spanKeys(keyList);
  drawMatcherPoints(keyList);
  var first = keyInformation[keyList[0]];
  var last  = keyInformation[keyList[keyList.length-1]];
  var width = last.right - first.left;
  var leftedge = (first.left * 50 + 50);
  var halfwidth = ((width*50)/2);
  var xOffset = leftedge + halfwidth;

  var text = draw.text(letter)
    .font({
      size: 24,
      anchor: 'middle'
    })
    .fill({ color: lightText})
    .transform({
      x: xOffset,
      y: 25
    });

}
;
