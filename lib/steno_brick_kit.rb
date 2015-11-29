module Dimensions
  HORIZONTAL_UNIT = 100
  HORIZONTAL_PINCH = 5

  V_STARTER=100
  VERTICAL_UNIT_CURVE = 20
  TOP_HEIGHT = 50
  BOTTOM_HEIGHT = 120
  THUMB_HEIGHT = 200
  SPAN_CURVE = 10
end

module StenoBrickKit
  def self.keyboard
    @keyboard ||= Steno::Keyboard.new
  end

  def self.span_key_symbols
    1.upto(15).map do |width|
      {
        id: "span-width-#{width}",
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT * 0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT * 0.5 * width - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT * 0.5 * width} #{Dimensions::V_STARTER + Dimensions::SPAN_CURVE}",
          "  #{Dimensions::HORIZONTAL_UNIT * 0.5 * width} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT - Dimensions::SPAN_CURVE}",
          "  #{Dimensions::HORIZONTAL_UNIT * 0.5 * width - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "L #{Dimensions::HORIZONTAL_UNIT * 0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "C  0 #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT - Dimensions::SPAN_CURVE}",
          "   0 #{Dimensions::V_STARTER + Dimensions::SPAN_CURVE}",
          "  #{Dimensions::HORIZONTAL_UNIT * 0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "z"
        ]
      }
    end
  end

  def self.symbols
    [
      {
        id: 'topRowPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'bottomRowPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'thumbFirstPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'thumbSecondPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'starKeyPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'numberKeyPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'matcher-width-1',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5 - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5 - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*0.75}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*0.75}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "z"
        ]
      },
      {
        id: 'matcher-width-2',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0 - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0 - Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*0.75}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*0.75}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0 + Dimensions::HORIZONTAL_PINCH} #{Dimensions::V_STARTER}",
          "z"
        ]
      }
    ]
  end

  def self.thumbs
    keyboard.filter(finger: 'thumb')
  end

  def self.starButton
    keyboard.filter(label: '*')
  end

  def self.leftBottom
    keyboard.filter(side: 'left', row: 'bottom')
  end

  def self.leftTop
    keyboard.filter(side: 'left', row: 'top')
  end

  def self.rightBottom
    keyboard.filter(side: 'right', row: 'bottom')
  end

  def self.rightTop
    keyboard.filter(side: 'right', row: 'top')
  end

  def self.numberButton
    keyboard.filter(label: '#')
  end

  def self.buttons
    [
      thumbs,
      leftBottom,
      starButton,
      rightBottom,
      numberButton,
      leftTop,
      rightTop,
    ].flatten
  end

  def self.labels
    Steno::KEY_INFORMATION.values
  end
end
